.class public Lfreemarker/core/_DelayedJQuote;
.super Lfreemarker/core/_DelayedConversionToString;
.source "_DelayedJQuote.java"


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 9
    invoke-direct {p0, p1}, Lfreemarker/core/_DelayedConversionToString;-><init>(Ljava/lang/Object;)V

    .line 10
    return-void
.end method


# virtual methods
.method protected doConversion(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 13
    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
