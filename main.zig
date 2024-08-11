//! Developing a 2D vector library and a (in future*) 3D vector library
//! Written by Biggie Cheese
//! Started 09-08-2024

/// Todo:
///     Add error handling
///     Make 2D vectors more user-friendly data-type wise
///     Add 3D vectors
const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    var a: u32 = 0; a = 0;
    print("{any}\n", .{a});

    const vector_1 = vect2D{ .x = -10, .y = 0.5 };
    const vector_2 = vect2D{ .x = 15, .y = 5 };
    const theta = vector2DFuncs.angle(vector_1, vector_2);
    print("{d}\n", .{theta});
}

const vect2D = struct {
    x: f32 = 0,
    y: f32 = 0,
};

const vector2DFuncs = struct {
    pub fn addVectors(a: vect2D, b: vect2D) vect2D {
        return vect2D{ .x = a.x + b.x, .y = a.y + b.y };
    }

    pub fn subtractVectors(a: vect2D, b: vect2D) vect2D {
        return vect2D{ .x = a.x - b.x, .y = a.y - b.y };
    }

    pub fn dotProd(a: vect2D, b: vect2D) f32 {
        // Using the co-ordinate form
        const dot: f32 = (a.x * b.x) + (a.y * b.y);
        return dot;
    }

    pub fn angle(a: vect2D, b: vect2D) f32 {
        const rads = false;
        // using dot(a, b) / mag(a)*mag(b)
        const magnitude_a = a.x * a.x + a.y * a.y;
        const magnitude_b = b.x * b.x + b.y * b.y;
        const mag_a = @sqrt(magnitude_a);
        const mag_b = @sqrt(magnitude_b);
        const dot = dotProd(a, b);
        const theta = dot / (mag_a * mag_b);
        if (rads == true) {
            return std.math.acos(theta);
        } else {
            return std.math.radiansToDegrees(std.math.acos(theta));
        }
    }
};
