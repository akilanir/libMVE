.class public Lorg/piwik/sdk/tools/CurrencyFormatter;
.super Ljava/lang/Object;
.source "CurrencyFormatter.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static priceString(I)Ljava/lang/String;
    .registers 6
    .param p0, "cents"    # I

    .prologue
    .line 14
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "0.00"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 15
    .local v0, "form":Ljava/text/DecimalFormat;
    int-to-double v1, p0

    const-wide/high16 v3, 0x4059000000000000L    # 100.0

    div-double/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
