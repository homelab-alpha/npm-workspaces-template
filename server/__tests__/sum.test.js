// A simple function to test.
function sum(a, b) {
  return a + b;
}

// Describe the test suite for the 'sum' function.
describe("sum", () => {
  // Test case for adding two positive numbers.
  test("should add two positive numbers correctly", () => {
    // The 'expect' function is used to make assertions.
    // We expect the result of sum(1, 2) to be equal to 3.
    expect(sum(1, 2)).toBe(3);
  });

  // Test case for adding a positive and a negative number.
  test("should add a positive and a negative number correctly", () => {
    expect(sum(5, -2)).toBe(3);
  });
});
