`timescale 1ns / 1ps
module Morse_Code_Encryptor (
    input      [4:0] IN,
    input            clk,
    input            rst_n,
    input            EN,
    output reg       OUT
);
    localparam A_MORSE = 16'b0101110000000000;
    localparam B_MORSE = 16'b0111010101000000;
    localparam C_MORSE = 16'b0111010111010000;
    localparam D_MORSE = 16'b0111010100000000;
    localparam E_MORSE = 16'b0100000000000000;
    localparam F_MORSE = 16'b0101011101000000;
    localparam G_MORSE = 16'b0111011101000000;
    localparam H_MORSE = 16'b0101010100000000;
    localparam I_MORSE = 16'b0101000000000000;
    localparam J_MORSE = 16'b0101110111011100;
    localparam K_MORSE = 16'b0111010111000000;
    localparam L_MORSE = 16'b0101110101000000;
    localparam M_MORSE = 16'b0111011100000000;
    localparam N_MORSE = 16'b0111010000000000;
    localparam O_MORSE = 16'b0111011101110000;
    localparam P_MORSE = 16'b0101110111010000;
    localparam Q_MORSE = 16'b0111011101011100;
    localparam R_MORSE = 16'b0101110100000000;
    localparam S_MORSE = 16'b0101010000000000;
    localparam T_MORSE = 16'b0111000000000000;
    localparam U_MORSE = 16'b0101011100000000;
    localparam V_MORSE = 16'b0101010111000000;
    localparam W_MORSE = 16'b0101110111000000;
    localparam X_MORSE = 16'b0111010101110000;
    localparam Y_MORSE = 16'b0111010111011100;
    localparam Z_MORSE = 16'b0111011101010000;

    localparam A = 5'd1;
    localparam B = 5'd2;
    localparam C = 5'd3;
    localparam D = 5'd4;
    localparam E = 5'd5;
    localparam F = 5'd6;
    localparam G = 5'd7;
    localparam H = 5'd8;
    localparam I = 5'd9;
    localparam J = 5'd10;
    localparam K = 5'd11;
    localparam L = 5'd12;
    localparam M = 5'd13;
    localparam N = 5'd14;
    localparam O = 5'd15;
    localparam P = 5'd16;
    localparam Q = 5'd17;
    localparam R = 5'd18;
    localparam S = 5'd19;
    localparam T = 5'd20;
    localparam U = 5'd21;
    localparam V = 5'd22;
    localparam W = 5'd23;
    localparam X = 5'd24;
    localparam Y = 5'd25;
    localparam Z = 5'd26;

    reg [15:0] tempMorse;

    always @(*) begin
        case (IN)
            A: tempMorse = A_MORSE;
            B: tempMorse = B_MORSE;
            C: tempMorse = C_MORSE;
            D: tempMorse = D_MORSE;
            E: tempMorse = E_MORSE;
            F: tempMorse = F_MORSE;
            G: tempMorse = G_MORSE;
            H: tempMorse = H_MORSE;
            I: tempMorse = I_MORSE;
            J: tempMorse = J_MORSE;
            K: tempMorse = K_MORSE;
            L: tempMorse = L_MORSE;
            M: tempMorse = M_MORSE;
            N: tempMorse = N_MORSE;
            O: tempMorse = O_MORSE;
            P: tempMorse = P_MORSE;
            Q: tempMorse = Q_MORSE;
            R: tempMorse = R_MORSE;
            S: tempMorse = S_MORSE;
            T: tempMorse = T_MORSE;
            U: tempMorse = U_MORSE;
            V: tempMorse = V_MORSE;
            W: tempMorse = W_MORSE;
            X: tempMorse = X_MORSE;
            Y: tempMorse = Y_MORSE;
            Z: tempMorse = Z_MORSE;
            default: tempMorse = 16'd0;
        endcase
    end

    reg [15:0] outMorse;

    always @(posedge clk) begin
        if (~rst_n) begin
            OUT <= 0;
            outMorse <= 0;
        end
        else begin
            if (outMorse == 0 && EN) begin
                outMorse <= tempMorse;
            end else begin
                OUT <= outMorse[15];
                outMorse <= outMorse << 1;
            end
        end
    end

endmodule