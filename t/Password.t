#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => 'pw';
zci is_cached   => 0;

ddg_goodie_test(
    [qw( DDG::Goodie::Password)],
    'pw 15 average' => test_zci(
        qr/.{15} \(random password\)/,
        structured_answer => {
            input     => ['15 characters', 'average strength'],
            operation => 'Random password',
            result    => qr/^.{15}$/
        }
    ),
    'password normal 15' => test_zci(
        qr/.{15} \(random password\)/,
        structured_answer => {
            input     => ['15 characters', 'average strength'],
            operation => 'Random password',
            result    => qr/^.{15}$/
        }
    ),
    'random pw 15 AVG' => test_zci(
        qr/.{15} \(random password\)/,
        structured_answer => {
            input     => ['15 characters', 'average strength'],
            operation => 'Random password',
            result    => qr/^.{15}$/
        }
    ),
    'pwgen strong 25' => test_zci(
        qr/.{25} \(random password\)/,
        structured_answer => {
            input     => ['25 characters', 'high strength'],
            operation => 'Random password',
            result    => qr/^.{25}$/
        }
    ),
    'password 25 hard' => test_zci(
        qr/.{25} \(random password\)/,
        structured_answer => {
            input     => ['25 characters', 'high strength'],
            operation => 'Random password',
            result    => qr/^.{25}$/
        }
    ),
    'Password High 25' => test_zci(
        qr/.{25} \(random password\)/,
        structured_answer => {
            input     => ['25 characters', 'high strength'],
            operation => 'Random password',
            result    => qr/^.{25}$/
        }
    ),
    # Example queries
    'random password' => test_zci(
        qr/.{8} \(random password\)/,
        structured_answer => {
            input     => ['8 characters', 'average strength'],
            operation => 'Random password',
            result    => qr/^.{8}$/
        }
    ),
    'random password strong 15' => test_zci(
        qr/.{15} \(random password\)/,
        structured_answer => {
            input     => ['15 characters', 'high strength'],
            operation => 'Random password',
            result    => qr/^.{15}$/
        }
    ),
    'password 15' => test_zci(
        qr/.{15} \(random password\)/,
        structured_answer => {
            input     => ['15 characters', 'average strength'],
            operation => 'Random password',
            result    => qr/^.{15}$/
        }
    ),
    'password 33' => test_zci(
        qr/.{33} \(random password\)/,
        structured_answer => {
            input     => ['33 characters', 'average strength'],
            operation => 'Random password',
            result    => qr/^.{33}$/
        }
    ),
    'password 65' => undef,
    'random password weak 5' => undef,
    'password 5 EaSy' => undef,
    'password low 5' => undef,
);

done_testing
