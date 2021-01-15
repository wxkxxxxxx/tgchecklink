#_ _ _ _,,_________________________
#<><><>//-----------------------~`
#
# https://t.me/wxkxxxxxx
#
use strict;
use warnings;
use feature qw/say/;
use HTTP::Tiny;

my %msg = (
  usage  => "=====\nЗапуск: perl wxk.pl [файл с ссылками или ссылки разделённые пробелом]\n\nЕсли указать ключ --save то скрипт сохранит результаты работы в файле wxkout.txt\n\nПример: perl wxk.pl mylinks.txt --save\n\nПравильные ссылки:\n\nlink\n\@link\nhttp://t.me/link\nhttps://t.me/link\nt.me/link\n=====\n"
  ,cantr => "-- Не могу прочитать "
  ,free  => "[ Свободно! ] -- "
  ,check => "\t-- Проверка "
  ,allf  => "\n===== [ Свободные ссылки ] =====\n"
  ,nofr  => "\n===== [ Свободных ссылок нет ] ====="

  ,trig  => '<div class="tgme_page_extra">'
);

die $msg{usage} unless @ARGV;

my @links;
my @freelinks;
my $save;
my $sfile = "./wxkout.txt";

sub saywork{
  say $_[0];
  say FHO shift if $save;
}

sub clink{
  for(@_){
    chomp;
    s!http(s)?://!!i;
    s!t\.me/!!;
    s/@//;
    push @links, "http://t.me/" . $_;
  }
}

$save++ if @ARGV ~~ /--save/;
for(@ARGV){ shift if /--save/ }
open FHO, ">", $sfile if $save;

my $file = open FH, "<", $ARGV[0];

&clink(@ARGV) unless $file;
if($file){ &clink($_) while <FH> }

for(@links){
  my $res = HTTP::Tiny->new->get($_);
  my $html;
  if ($res->{success}) {
      $html = $res->{content};
  }
  unless($html){
    &saywork($msg{cantr} . $_);
    next;
  }
  unless($html =~ m/$msg{trig}/i){
    &saywork($msg{free} . $_);
    push @freelinks, $_;
    next;
  }
  &saywork($msg{check} . $_);
}

&saywork($msg{allf}) if @freelinks;
&saywork("\t" . $_) for @freelinks;

&saywork($msg{nofr})  unless @freelinks;
