<h1><p align="center"><img alt="Banner" src="Denali.png" /></p></h1>

# Denali Test Network

## How to use the UPTAKE module to create NFT's

### 1. Create a Collection (Denomination)

Before you can create NFTs, you have to create a collection which your NFTs will belong to. Every collection requires both a unique name and id. 
To define the metadata for your NFT, you can either provide its content in the transcation itslef or set the path to the schema.json.

```
iond tx uptake issue <collection-id> \
	--name=<collection-name> \
	--schema=<schema-content or path/to/schema.json> \	
	--from=<from_address> \
	--chain-id=Test-Denali
```

Notes:
- `<collection-name>` alphanumeric value, min. 4 characters, has to start with a lower case letter
- `<collection-id>` alphanumeric value, min. 4 characters
- `<from_address>` your wallet address
- `schema` see the example for an erc721 schema below

<details>
  
  <summary>ERC721 Metadata JSON Schema</summary>
  
  ```
  {
    "title": "Asset Metadata",
    "type": "object",
    "properties": {
        "name": {
            "type": "string",
            "description": "Identifies the asset to which this NFT represents",
        },
        "description": {
            "type": "string",
            "description": "Describes the asset to which this NFT represents",
        },
        "image": {
            "type": "string",
            "description": "A URI pointing to a resource with mime type image/* representing the asset to which this NFT represents. Consider making any images at a width between 320 and 1080 pixels and aspect ratio between 1.91:1 and 4:5 inclusive.",
        }
    }
}
  ```
  
</details>

<details>
  
  <summary>Example:</summary>

```
iond tx uptake issue mightysword9 \
	--from=idep1heg29v6tc7npk950pgd3phl5g2ll306pzy68ha \
	--name=MightySword \
	--schema="schema.json" \
	--chain-id=Test-Denali
```

### 2. Create NFTs

After creating the collection we can create the corresponding NFTs. Similar to the collection, NFTs have an unique name and id. Furthermore you have to define the recipient of the NFT.
Through the uri flag, you can define the address where the metadata for this specific NFT is stored. Metadata can be either stored centralized (your own api) or dezentralized (e.g. [ipfs.io])

```
iond tx uptake mint <collection-id> <item-id> \
	--name=<item-name> \
  	--uri=<uri>
	--from=<from_address> \
	--recipient=<owner_address> \
	--chain-id=<chain-id>
```

<details>
  
  <summary>Example:</summary>


```
iond tx uptake mint mightysword9 sworditem001 \
	--name=SwordItem \
	--uri=ipfs://ipfs2askmak2344dkabmna0
	--recipient=idep1heg29v6tc7npk950pgd3phl5g2ll306pzy68ha \
	--from=idep1heg29v6tc7npk950pgd3phl5g2ll306pzy68ha  \
	--chain-id=Test-Denali
```
	
</details>

### 3. Other transaction commands

#### 3.1 Transfer NFT

```
iond tx uptake transfer <recipient> <collection-id> <item-id> \
	--uri=<uri> \
	--from=<from_address> \
	--chain-id=<chain-id>
```
<details>
  
  <summary>Example:</summary>


```
iond tx uptake transfer idep1heg29v6tc7npk950pgd3phl5g2ll306pzy453ha mightysword9 sworditem001 \
	--uri=ipfs://ipfs2askmak2344dkabmna0 \
	--from=idep1heg29v6tc7npk950pgd3phl5g2ll306pzy68ha \
	--chain-id Test-Denali
```

</details>	

#### 3.2 Burn NFT

```
iond tx uptake burn <collection-id> <item-id> \
	--uri=<uri> \
	--from=<from_address> \
	--chain-id=<chain-id>
```
<details>
  
  <summary>Example:</summary>


```
iond tx uptake burn mightysword9 sworditem001 \
	--uri=ipfs://ipfs2askmak2344dkabmna0 \
	--from=idep1heg29v6tc7npk950pgd3phl5g2ll306pzy68ha \
	--chain-id Test-Denali
```

</details>
	
### 4. Query commands

#### 4.1 Query all collections

```
iond query uptake denoms
```

#### 4.2 Query the details of a collection

```
iond query uptake denom <collection-id>
```
<details>
  
  <summary>Example:</summary>

```
iond query uptake denom mightysword9
```

</details>
	
#### 4.3 Query the details of the collection and all NFTs of a collection

```
iond query uptake collection <collection-id>
```
<details>
  
  <summary>Example:</summary>

```
iond query uptake collection mightysword9
```

</details>
	
#### 4.4 Query all collections/nfts of a spcific owner

```
iond query uptake owner <owner-address>
```
<details>
  
  <summary>Example:</summary>

```
iond query uptake owner idep1y346pfnqjwf335wqqxpm60aa2m9h6lm3ucxexu
```
	
</details>	

#### 4.5 Query nfts of a spcific collection for a owner

```
iond query uptake owner <owner-address> --denom-id=<collection-id>
```
<details>
  
  <summary>Example:</summary>

```
iond q uptake owner idep1y346pfnqjwf335wqqxpm60aa2m9h6lm3ucxexu --denom-id=mightysword9
```
	
</details>	

#### 4.6 Query the total supply for a collection

```
iond query uptake supply <collection-id>
```
<details>
  
  <summary>Example:</summary>

```
iond query uptake supply mightysword9
```

	
</details>
	
#### 4.7 Query the details for a specific NFT

```
iond query uptake token <collection-id> <item-id>
```
<details>
  
  <summary>Example:</summary>

```
iond query uptake token mightysword9 sworditem001
```

	
</details>
