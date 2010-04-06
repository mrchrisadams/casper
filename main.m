//
//  main.m
//  casper
//
//  Created by Chris Adams on 06/04/2010.
//  Copyright Headshift Ltd. 2010. All rights reserved.
//

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
