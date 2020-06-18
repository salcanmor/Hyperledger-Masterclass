### ON Server 1
### Generate the crypto meterials
source .env
rm -rf crypto-config/
echo "generating crypto meterials"
cryptogen generate --config=./crypto-config.yaml

echo "Creating Genesis Block and artifacts"
mkdir channel-artifacts
configtxgen -profile TwoOrgsOrdererGenesis -channelID $SYS_CHANNEL -outputBlock ./channel-artifacts/genesis.block
configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/mychannel.tx -channelID $CHANNEL_NAME
configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/ORG1MSPanchors_${CHANNEL_NAME}.tx -channelID $CHANNEL_NAME -asOrg Org1MSP
configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/ORG2MSPanchors_${CHANNEL_NAME}.tx -channelID $CHANNEL_NAME -asOrg Org2MSP
