// MathUtil.sp - A Sapphire Plugin for Advanced Math Utility functions

// Clamps a value between a minimum and maximum.
function MathUtil_clamp(double value, double min_val, double max_val) double {
    if (value < min_val) {
        return min_val;
    }
    if (value > max_val) {
        return max_val;
    }
    return value;
}

// Linear interpolation between 'a' and 'b' by 't'.
function MathUtil_lerp(double a, double b, double t) double {
    return a + (b - a) * t;
}

// Maps a value from one range to another.
function MathUtil_map(double value, double inMin, double inMax, double outMin, double outMax) double {
    double normalizedValue = (value - inMin) / (inMax - inMin);
    return outMin + normalizedValue * (outMax - outMin);
}

// Returns the smaller of two numbers.
function MathUtil_min(double a, double b) double {
    if (a < b) {
        return a;
    }
    return b;
}

// Returns the larger of two numbers.
function MathUtil_max(double a, double b) double {
    if (a > b) {
        return a;
    }
    return b;
}

// Returns the absolute value of a number.
function MathUtil_abs(double value) double {
    if (value < 0) {
        return 0 - value;
    }
    return value;
}

// Returns the largest integer less than or equal to 'value'. (Simplified)
function MathUtil_floor(double value) double {
    return value - (value % 1);
}

// Calculates the average of numbers in a list.
function MathUtil_average(class list) double { // 'class' para o tipo de lista/array
    double sum = 0;
    double count = len(list); // len() funciona para arrays
    double i = 0;
    while (i < count) {
        double element = list[i]; // Acesso direto por índice
        sum = sum + element;
        i = i + 1;
    }
    if (count > 0) {
        return sum / count;
    }
    return 0.0; // Return 0 if list is empty
}

// Calculates base raised to the power of exponent. (Integer exponents for simplicity)
function MathUtil_pow(double base, double exponent) double {
    double result = 1;
    double i = 0;
    if (exponent < 0) {
        // Handle negative exponent (pure Sapphire means no float pow, so inverse)
        base = 1 / base;
        exponent = 0 - exponent;
    }
    while (i < exponent) {
        result = result * base;
        i = i + 1;
    }
    return result;
}

// Global constant for Pi
double MathUtil_PI = 3.141592653589793;
