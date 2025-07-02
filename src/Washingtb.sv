module tb_Washing_Machine;

reg clk, reset, start, door_close, filled, detergent_added, cycleTO, againwash, spinTO, drained;
wire door_lock, motor_on, fill_val_on, drain_val_on, done, water_wash;

// Instantiate DUT
Washing_Machine uut (
    .clk(clk), .reset(reset), .start(start), .door_close(door_close),
    .filled(filled), .detergent_added(detergent_added), .cycleTO(cycleTO),
    .againwash(againwash), .spinTO(spinTO), .drained(drained),
    .door_lock(door_lock), .motor_on(motor_on), .fill_val_on(fill_val_on),
    .drain_val_on(drain_val_on), .done(done), .water_wash(water_wash)
);

// Clock generation
initial clk = 0;
always #5 clk = ~clk;

// Stimulus
initial begin
    // Initial values
    reset = 1; start = 0; door_close = 0; filled = 0; detergent_added = 0;
    cycleTO = 0; againwash = 0; spinTO = 0; drained = 0;

    #10 reset = 0;           // Release reset
    #10 start = 1; door_close = 1; // Start with door closed

    #20 filled = 1;          // Water filled
    #10 filled = 0;

    #10 detergent_added = 1; // Add detergent
    #10 detergent_added = 0;

    #30 cycleTO = 1;         // End of wash cycle
    #10 cycleTO = 0;

    #10 drained = 1;         // Drain complete
    #10 drained = 0;

    #20 spinTO = 1;          // Spin complete
    #10 spinTO = 0;

    #20 $finish;
end

// Monitor output
initial begin
    $monitor("Time=%0t | State=%b | motor=%b, fill=%b, drain=%b, lock=%b, done=%b, wash=%b",
             $time, uut.state, motor_on, fill_val_on, drain_val_on, door_lock, done, water_wash);
end

endmodule
