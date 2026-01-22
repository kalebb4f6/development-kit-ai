#!/usr/bin/env bash
#
# Tests for kb-ai CLI
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CLI="$PROJECT_ROOT/bin/kb-ai"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

TESTS_PASSED=0
TESTS_FAILED=0

test_pass() {
    echo -e "${GREEN}[PASS]${NC} $1"
    TESTS_PASSED=$((TESTS_PASSED + 1))
}

test_fail() {
    echo -e "${RED}[FAIL]${NC} $1"
    TESTS_FAILED=$((TESTS_FAILED + 1))
}

run_test() {
    local name="$1"
    local cmd="$2"

    if eval "$cmd" > /dev/null 2>&1; then
        test_pass "$name"
    else
        test_fail "$name"
    fi
}

echo "========================================="
echo "       kb-ai CLI Tests"
echo "========================================="
echo ""

# Test 1: CLI exists and is executable
run_test "CLI exists" "test -x $CLI"

# Test 2: Help command works
run_test "Help command" "$CLI --help"

# Test 3: Version command works
run_test "Version command" "$CLI --version"

# Test 4: Version output format
VERSION_OUTPUT=$($CLI --version 2>&1)
if [[ "$VERSION_OUTPUT" =~ ^kb-ai\ v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    test_pass "Version format"
else
    test_fail "Version format (got: $VERSION_OUTPUT)"
fi

# Test 5: Unknown command shows error
if $CLI unknown-command 2>&1 | grep -q "Unknown command"; then
    test_pass "Unknown command error"
else
    test_fail "Unknown command error"
fi

# Test 6: Feature command without args shows usage
if $CLI feature 2>&1 | grep -q "Usage"; then
    test_pass "Feature usage"
else
    test_fail "Feature usage"
fi

# Test 7: Init-kit creates directories
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"
mkdir -p .git  # Simulate git repo
if $CLI init-kit > /dev/null 2>&1 && test -d .ai/commands; then
    test_pass "Init-kit creates .ai/commands"
else
    test_fail "Init-kit creates .ai/commands"
fi
cd "$PROJECT_ROOT"
rm -rf "$TEMP_DIR"

echo ""
echo "========================================="
echo "       Results"
echo "========================================="
echo ""
echo -e "Passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "Failed: ${RED}$TESTS_FAILED${NC}"
echo ""

if [ $TESTS_FAILED -gt 0 ]; then
    exit 1
fi
