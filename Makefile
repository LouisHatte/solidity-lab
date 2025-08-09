.PHONY: test deploy

ANVIL := http://127.0.0.1:8545
PRIVATE_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

CONTRACT := 0x5FC8d32690cc91D4c39d9d3abcBD16989F875707

test:
	@forge test \
	--fork-url $(ANVIL) \
	-vv

deploy:
	@forge script script/Deploy.s.sol:Deploy \
	--rpc-url $(ANVIL) \
	--private-key  $(PRIVATE_KEY) \
	--broadcast
