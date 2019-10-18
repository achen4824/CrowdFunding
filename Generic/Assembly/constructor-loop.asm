tag 13			for(uint i = 0;i<insertValues....
  JUMPDEST 			for(uint i = 0;i<insertValues....
  DUP2 			insertValues
  MLOAD 			insertValues.length
  DUP2 			i
  LT 			i<insertValues.length
  ISZERO 			for(uint i = 0;i<insertValues....
  PUSH [tag] 14			for(uint i = 0;i<insertValues....
  JUMPI 			for(uint i = 0;i<insertValues....
  PUSH 2			values
  DUP3 			insertValues
  DUP3 			i
  DUP2 			insertValues[i]
  MLOAD 			insertValues[i]
  DUP2 			insertValues[i]
  LT 			insertValues[i]
  PUSH [tag] 16			insertValues[i]
  JUMPI 			insertValues[i]
  INVALID 			insertValues[i]
tag 16			insertValues[i]
  JUMPDEST 			insertValues[i]
  PUSH 20			insertValues[i]
  MUL 			insertValues[i]
  PUSH 20			insertValues[i]
  ADD 			insertValues[i]
  ADD 			insertValues[i]
  MLOAD 			insertValues[i]
  SWAP1 			values.push(insertValues[i])
  DUP1 			values.push(insertValues[i])
  PUSH 1			t
  DUP2 			\n\r\n
  SLOAD 			.6.0;\r\n\r\nc
  ADD 			2 <0.6.0;\r\n\r\ncontr
  DUP1 			{\r\n    \r\n 
  DUP3 			ndi
  SSTORE 			crowdfunding{\r\n    \r\n  
  DUP1 			Struct\r\n  
  SWAP2 			Funder Struct\r\n  
  POP 			Funder Struct\r\n  
  POP 			pragma solidity >=0.4.22 <0.6....
  SWAP1 			values.push(insertValues[i])
  PUSH 1			values.push(insertValues[i])
  DUP3 			values.push(insertValues[i])
  SUB 			values.push(insertValues[i])
  SWAP1 			values.push(insertValues[i])
  PUSH 0			values.push(insertValues[i])
  MSTORE 			values.push(insertValues[i])
  PUSH 20			values.push(insertValues[i])
  PUSH 0			values.push(insertValues[i])
  KECCAK256 			values.push(insertValues[i])
  ADD 			values.push(insertValues[i])
  PUSH 0			values.push(insertValues[i])
  SWAP1 			values.push(insertValues[i])
  SWAP2 			values.push(insertValues[i])
  SWAP3 			values.push(insertValues[i])
  SWAP1 			values.push(insertValues[i])
  SWAP2 			values.push(insertValues[i])
  SWAP1 			values.push(insertValues[i])
  SWAP2 			values.push(insertValues[i])
  POP 			values.push(insertValues[i])
  SSTORE 			values.push(insertValues[i])
  POP 			values.push(insertValues[i])
  PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			-1
  PUSH 7			indexes
  PUSH 0			indexes[insertValues[i]]
  DUP5 			insertValues
  DUP5 			i
  DUP2 			insertValues[i]
  MLOAD 			insertValues[i]
  DUP2 			insertValues[i]
  LT 			insertValues[i]
  PUSH [tag] 18			insertValues[i]
  JUMPI 			insertValues[i]
  INVALID 			insertValues[i]
tag 18			insertValues[i]
  JUMPDEST 			insertValues[i]
  PUSH 20			insertValues[i]
  MUL 			insertValues[i]
  PUSH 20			insertValues[i]
  ADD 			insertValues[i]
  ADD 			insertValues[i]
  MLOAD 			insertValues[i]
  DUP2 			indexes[insertValues[i]]
  MSTORE 			indexes[insertValues[i]]
  PUSH 20			indexes[insertValues[i]]
  ADD 			indexes[insertValues[i]]
  SWAP1 			indexes[insertValues[i]]
  DUP2 			indexes[insertValues[i]]
  MSTORE 			indexes[insertValues[i]]
  PUSH 20			indexes[insertValues[i]]
  ADD 			indexes[insertValues[i]]
  PUSH 0			indexes[insertValues[i]]
  KECCAK256 			indexes[insertValues[i]]
  DUP2 			indexes[insertValues[i]] = -1
  SWAP1 			indexes[insertValues[i]] = -1
  SSTORE 			indexes[insertValues[i]] = -1
  POP 			indexes[insertValues[i]] = -1
  DUP1 			i++
  DUP1 			i++
  PUSH 1			i++
  ADD 			i++
  SWAP2 			i++
  POP 			i++
  POP 			i++
  PUSH [tag] 13			for(uint i = 0;i<insertValues....
  JUMP 			for(uint i = 0;i<insertValues....
tag 14			for(uint i = 0;i<insertValues....
  JUMPDEST 			for(uint i = 0;i<insertValues....