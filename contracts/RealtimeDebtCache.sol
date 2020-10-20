pragma solidity ^0.5.16;

// Inheritance
import "./DebtCache.sol";


// https://docs.synthetix.io/contracts/RealtimeDebtCache
contract RealtimeDebtCache is DebtCache {
    constructor(address _owner, address _resolver) public DebtCache(_owner, _resolver) {}

    // Report the current debt values from all all cached debt functions

    function cachedSNXIssuedDebtForCurrencies(bytes32[] calldata currencyKeys)
        external
        view
        returns (uint[] memory snxIssuedDebts)
    {
        (uint[] memory debts, ) = _currentSNXIssuedDebtForCurrencies(currencyKeys);
        return debts;
    }

    function cachedSNXIssuedDebtInfo()
        external
        view
        returns (
            uint debt,
            uint timestamp,
            bool isInvalid,
            bool isStale
        )
    {
        (uint currentDebt, bool invalid) = _currentSNXIssuedDebt();
        return (currentDebt, block.timestamp, invalid, false);
    }

    // Stub out all mutative functions as no-ops;
    // since they do nothing, their access restrictions have been dropped

    function purgeDebtCacheForSynth(bytes32 currencyKey) external {}

    function cacheSNXIssuedDebt() external {}

    function updateSNXIssuedDebtForCurrencies(bytes32[] calldata currencyKeys) external {}

    function updateSNXIssuedDebtForCurrencyWithRate(bytes32 currencyKey, uint currencyRate) external {}

    function updateSNXIssuedDebtForCurrenciesWithRates(bytes32[] calldata currencyKeys, uint[] calldata currencyRates)
        external
    {}

    function changeDebtCacheValidityIfNeeded(bool currentlyInvalid) external {}
}
