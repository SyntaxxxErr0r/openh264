GTEST_SRCDIR=gtest
GTEST_CPP_SRCS=\
	$(GTEST_SRCDIR)/./src/gtest-all.cc\

GTEST_OBJS += $(GTEST_CPP_SRCS:.cc=.o)
OBJS += $(GTEST_OBJS)
$(GTEST_SRCDIR)/%.o: $(GTEST_SRCDIR)/%.cc
	$(QUIET_CXX)$(CXX) $(CFLAGS) $(CXXFLAGS) $(INCLUDES) $(GTEST_CFLAGS) $(GTEST_INCLUDES) -c $(CXX_O) $<

$(LIBPREFIX)gtest.$(LIBSUFFIX): $(GTEST_OBJS)
	$(QUIET)rm -f $@
	$(QUIET_AR)$(AR) $(AR_OPTS) $+

libraries: $(LIBPREFIX)gtest.$(LIBSUFFIX)
LIBRARIES += $(LIBPREFIX)gtest.$(LIBSUFFIX)
