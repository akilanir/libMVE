.class public Lfreemarker/core/_DelayedAOrAn;
.super Lfreemarker/core/_DelayedConversionToString;
.source "_DelayedAOrAn.java"


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 7
    invoke-direct {p0, p1}, Lfreemarker/core/_DelayedConversionToString;-><init>(Ljava/lang/Object;)V

    .line 8
    return-void
.end method


# virtual methods
.method protected doConversion(Ljava/lang/Object;)Ljava/lang/String;
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 12
    .local v0, "s":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-static {v0}, Lfreemarker/core/MessageUtil;->getAOrAn(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
