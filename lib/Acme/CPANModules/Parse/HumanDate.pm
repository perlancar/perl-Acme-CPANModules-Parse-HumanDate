# no code
## no critic: TestingAndDebugging::RequireUseStrict
package Acme::CPANModules::Parse::HumanDate;

# AUTHORITY
# DATE
# DIST
# VERSION

our $LIST = {
    summary => "Modules that parse human date/time expression",
    entries => [
        {
            module=>'DateTime::Format::Natural',
            description => <<'_',

Compared to <pm:DateTime::Format::Flexible>, this module can also parse
duration in addition to date/time, e.g.:

    2 years 3 months

And it also can extract the date expression from a longer string.

Speed-wise, I'd say the two modules are roughly comparable. For some patterns
one might be faster than the other.

_
            bench_code_template => 'DateTime::Format::Natural->new->parse_datetime(<str>)',
        },
        {
            module=>'DateTime::Format::Flexible',
            description => <<'_',

One advantage of this over <pm:DateTime::Format::Natural> is its time zone
support, e.g.:

    yesterday 8pm UTC
    yesterday 20:00 +0800
    yesterday 20:00 Asia/Jakarta

Speed-wise, I'd say the two modules are roughly comparable. For some patterns
one might be faster than the other.

_
            bench_code_template => 'DateTime::Format::Flexible->new->parse_datetime(<str>)',
        },

        {
            module => 'Date::Parse',
            description => <<'_',

This module can parse several formats, but does not really fall into "human
date/time parser" as it lacks support for casual expression like "yesterday" or
3 hours ago".

_
        },
    ],

    bench_datasets => [
        {args=>{str => 'yesterday'}},
        {args=>{str => '2 days ago'}},
        {args=>{str => '2021-09-06 20:03:00'}},
    ],
};

1;
# ABSTRACT:

=head1 DESCRIPTION
