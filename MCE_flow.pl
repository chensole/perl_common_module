#!usr/bin/perl -w
use strict;
 
# File Name: MCE_flow.pl
# Author: chensole
# mail: 1278371386@qq.com
# Created Time: 2019-08-08
use MCE::Flow;
use MCE::Flow;
use MCE::Queue;
my @a;

mce_flow {
   task_name => [ 'a', 'b', 'c' ], task_end => \&task_end,
   gather => preserve_order(\@a)

}, \&task_a, \&task_b, \&task_c, 1..10000;

print "@a\n";


sub preserve_order {
   my %tmp; my $order_id = 1; my $gather_ref = $_[0];
   @{ $gather_ref } = ();  ## clear the array (optional)

   return sub {
      my ($data_ref, $chunk_id) = @_;
      $tmp{$chunk_id} = $data_ref;

      while (1) {
         last unless exists $tmp{$order_id};
         push @{ $gather_ref }, @{ delete $tmp{$order_id++} };
      }

      return;
   };
}

my $b = MCE::Queue->new;
my $c = MCE::Queue->new;




sub task_end {
   my ($mce, $task_id, $task_name) = @_;

   if (defined $mce->{user_tasks}->[$task_id + 1]) {
      my $n_workers = $mce->{user_tasks}->[$task_id + 1]->{max_workers};

      if ($task_name eq 'a') {
         $b->enqueue((undef) x $n_workers);
      }
      elsif ($task_name eq 'b') {
         $c->enqueue((undef) x $n_workers);
      }
   }

   return;
}


sub task_a {
   my @ans; my ($mce, $chunk_ref, $chunk_id) = @_;

   push @ans, map { $_ * 2 } @{ $chunk_ref };
   $b->enqueue(MCE->freeze([ \@ans, $chunk_id ]));

   return;
}

sub task_b {
   my ($mce) = @_;

   while (1) {
      my @ans; 
	  my $chunk = $b -> dequeue;
      last unless defined $chunk;

      $chunk = MCE->thaw($chunk);
      push @ans, map { $_ * 3 } @{ $chunk->[0] };
      $c->enqueue(MCE->freeze([ \@ans, $chunk->[1] ]));
   }

   return;
}

sub task_c {
   my ($mce) = @_;

   while (1) {
      my @ans; my $chunk = $c->dequeue;
      last unless defined $chunk;

      $chunk = MCE->thaw($chunk);
      push @ans, map { $_ * 4 } @{ $chunk->[0] };
      MCE->gather(\@ans, $chunk->[1]);
   }

   return;
}
