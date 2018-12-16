module Data_Memory (Address, WriteData, MemRead, MemWrite, ReadData);
    
input [63:0] Address;
input [63:0] WriteData;
input MemRead;
input MemWrite;

output reg [63:0] ReadData;

reg [31:0] datamemory [63:0]; 

integer i=0;
initial
begin
    for (i=0; i<32; i=i+1) datamemory[i] = 0;
end

always@(MemRead)
begin
    if(MemRead==1)
        ReadData <= datamemory[Address];
end
always@(MemWrite)
begin
    if(MemWrite==1)
	datamemory[Address] <= WriteData;
end

endmodule