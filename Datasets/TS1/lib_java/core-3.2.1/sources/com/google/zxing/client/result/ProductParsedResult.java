package com.google.zxing.client.result;

/* loaded from: core-3.2.1.jar:com/google/zxing/client/result/ProductParsedResult.class */
public final class ProductParsedResult extends ParsedResult {
    private final String productID;
    private final String normalizedProductID;

    ProductParsedResult(String productID) {
        this(productID, productID);
    }

    ProductParsedResult(String productID, String normalizedProductID) {
        super(ParsedResultType.PRODUCT);
        this.productID = productID;
        this.normalizedProductID = normalizedProductID;
    }

    public String getProductID() {
        return this.productID;
    }

    public String getNormalizedProductID() {
        return this.normalizedProductID;
    }

    @Override // com.google.zxing.client.result.ParsedResult
    public String getDisplayResult() {
        return this.productID;
    }
}
