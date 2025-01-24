#!/bin/sh
#
#using fzf to search for required go doc in terminal
#
go doc `fzf < ./.gosyms`
