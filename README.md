### Ganache 6.4.3 gas estimation bug repro

### Install
```
npm install
```

### Reproduction
Comes with a `buidler.config.js` with a commented out `networks.develop.gas`. 

To see estimation errors run
```
npm run test:ganache
```

To see success under the same conditions with a geth client (requires docker) run:
```
npm run test:geth
```

To see success with ganache & specified network gas, uncomment `networks.develop.gas` and run
```
npm run test:ganache
```
