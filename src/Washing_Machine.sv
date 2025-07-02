// ========================================
// WASHING MACHINE MODULE
// ========================================
module Washing_Machine(
    input clk, 
    input reset, 
    input start, 
    input door_close, 
    input filled, 
    input detergent_added, 
    input cycleTO,
    input againwash, 
    input spinTO, 
    input drained,
    output reg door_lock, 
    output reg motor_on, 
    output reg fill_val_on, 
    output reg drain_val_on, 
    output reg done,  
    output reg water_wash
);

// State parameters
parameter IDLE = 3'b000, 
          FILL_WATER = 3'b001,
          ADD_DETERGENT = 3'b010,
          CYCLE = 3'b011,
          DRAIN = 3'b100,
          SPIN = 3'b101;

reg [2:0] state, next_state;

// Sequential logic for state transitions
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
    end
    else begin
        state <= next_state;
    end
end

// Combinational logic for next state and outputs
always @(*) begin
    // Default output values to prevent latches
    door_lock = 1'b0;
    motor_on = 1'b0;
    fill_val_on = 1'b0;
    drain_val_on = 1'b0;
    done = 1'b0;
    water_wash = 1'b0;
    next_state = IDLE;
    
    case(state)
        IDLE: begin
            if (start && door_close) begin
                next_state = FILL_WATER;
                door_lock = 1'b1;
            end
            else begin
                next_state = IDLE;
                door_lock = 1'b0;
            end
        end

        FILL_WATER: begin
            door_lock = 1'b1;
            if (filled) begin
                if (!detergent_added) begin
                    next_state = ADD_DETERGENT;
                end
                else begin
                    next_state = CYCLE;
                    motor_on = 1'b1;
                    water_wash = 1'b1;
                end
            end
            else begin
                next_state = FILL_WATER;
                fill_val_on = 1'b1;
            end
        end

        ADD_DETERGENT: begin
            door_lock = 1'b1;
            if (detergent_added) begin
                next_state = CYCLE;
                motor_on = 1'b1;
                water_wash = 1'b1;
            end
            else begin
                next_state = ADD_DETERGENT;
            end
        end

        CYCLE: begin
            door_lock = 1'b1;
            water_wash = 1'b1;
            if (cycleTO) begin
                next_state = DRAIN;
                drain_val_on = 1'b1;
            end
            else begin
                next_state = CYCLE;
                motor_on = 1'b1;
            end
        end

        DRAIN: begin
            door_lock = 1'b1;
            drain_val_on = 1'b1;
            if (drained) begin
                if (againwash) begin
                    next_state = FILL_WATER;
                end
                else begin
                    next_state = SPIN;
                    motor_on = 1'b1;  // Motor for spinning
                end
            end
            else begin
                next_state = DRAIN;
            end
        end

        SPIN: begin
            door_lock = 1'b1;
            motor_on = 1'b1;  // Motor should be on during spinning
            if (spinTO) begin
                next_state = IDLE;
                done = 1'b1;
                door_lock = 1'b0;  // Unlock door when done
            end
            else begin
                next_state = SPIN;
            end
        end

        default: begin
            next_state = IDLE;
        end
    endcase
end

endmodule

