#make view_coverage

make cli TEST_SEED=3134984174 TEST_NAME=alu_test CODE_COVERAGE_ENABLE=1 BATCH_DO_COMMANDS='-l $(TEST_NAME).$(TEST_SEED).transcript -do " set NoQuitOnFinish 1; run -a; coverage attribute -name TESTNAME -value $(TEST_NAME).$(TEST_SEED); coverage save $(TEST_NAME).$(TEST_SEED).ucdb; quit -f "'
#make run_cli TEST_SEED=2580137360 TEST_NAME=alu_ld_test CODE_COVERAGE_ENABLE=1 BATCH_DO_COMMANDS='-l $(TEST_NAME).$(TEST_SEED).transcript -do "set NoQuitOnFinish 1; run -a; coverage attribute -name TESTNAME -value $(TEST_NAME).$(TEST_SEED); coverage save $(TEST_NAME).$(TEST_SEED).ucdb; quit -f"'
#make run_cli TEST_SEED=2580137360 TEST_NAME=alu_st_test CODE_COVERAGE_ENABLE=1 BATCH_DO_COMMANDS='-l $(TEST_NAME).$(TEST_SEED).transcript -do "set NoQuitOnFinish 1; run -a; coverage attribute -name TESTNAME -value $(TEST_NAME).$(TEST_SEED); coverage save $(TEST_NAME).$(TEST_SEED).ucdb; quit -f"'
#make run_cli TEST_SEED=3134984174 TEST_NAME=alu_mem_test CODE_COVERAGE_ENABLE=1 BATCH_DO_COMMANDS='-l $(TEST_NAME).$(TEST_SEED).transcript -do "set NoQuitOnFinish 1; run -a; coverage attribute -name TESTNAME -value $(TEST_NAME).$(TEST_SEED); coverage save $(TEST_NAME).$(TEST_SEED).ucdb; quit -f"'
make run_cli TEST_SEED=3134984174 TEST_NAME=test_top CODE_COVERAGE_ENABLE=1 BATCH_DO_COMMANDS='-l $(TEST_NAME).$(TEST_SEED).transcript -do "set NoQuitOnFinish 1; run -a; coverage attribute -name TESTNAME -value $(TEST_NAME).$(TEST_SEED); coverage save $(TEST_NAME).$(TEST_SEED).ucdb; quit -f"' 
make run_cli TEST_SEED=3134984174 TEST_NAME=alu_control_test CODE_COVERAGE_ENABLE=1 BATCH_DO_COMMANDS='-l $(TEST_NAME).$(TEST_SEED).transcript -do "set NoQuitOnFinish 1; run -a; coverage attribute -name TESTNAME -value $(TEST_NAME).$(TEST_SEED); coverage save $(TEST_NAME).$(TEST_SEED).ucdb; quit -f"'
#make run_cli TEST_SEED=3134984174 TEST_NAME=mem_control_test CODE_COVERAGE_ENABLE=1 BATCH_DO_COMMANDS='-l $(TEST_NAME).$(TEST_SEED).transcript -do "set NoQuitOnFinish 1; run -a; coverage attribute -name TESTNAME -value $(TEST_NAME).$(TEST_SEED); coverage save $(TEST_NAME).$(TEST_SEED).ucdb; quit -f"'

#make run_cli TEST_SEED=3134984174 TEST_NAME=mem_test CODE_COVERAGE_ENABLE=1 BATCH_DO_COMMANDS='-l $(TEST_NAME).$(TEST_SEED).transcript -do "set NoQuitOnFinish 1; run -a; coverage attribute -name TESTNAME -value $(TEST_NAME).$(TEST_SEED); coverage save $(TEST_NAME).$(TEST_SEED).ucdb; quit -f"' 
make run_cli TEST_SEED=3134984174 TEST_NAME=control_test CODE_COVERAGE_ENABLE=1 BATCH_DO_COMMANDS='-l $(TEST_NAME).$(TEST_SEED).transcript -do "set NoQuitOnFinish 1; run -a; coverage attribute -name TESTNAME -value $(TEST_NAME).$(TEST_SEED); coverage save $(TEST_NAME).$(TEST_SEED).ucdb; quit -f"' 


make merge_coverage
make view_coverage
