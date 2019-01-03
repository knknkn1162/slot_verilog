# How to use

```bash
git clone https://github.com/knknkn1162/verilog_template.git project_name
# exec make command on the project according to Makefile in the subdirectory.
make
git remote rename origin template
git remote add origin $git_project_url
# after (several) commit(s)
git push -u origin master
```

# environments

+ The verilog compiler .. icarus verilog.

+ The default CI .. circle CI. The dashboard is [here](https://circleci.com/gh/knknkn1162/verilog_template)

# (MY) coding rules

## prefix & suffix

||prefix|suffix|remarks|
|---|---|---|---|
|input|`i_`||
|output|`o_`||
|wire|`s_`||
|reg|`s_`||
|n-clk delay||`_$n`|
|block in marco||`_block`|NOT semicolon|

# macros

The general macros is included in `macro` directory for testbench.
