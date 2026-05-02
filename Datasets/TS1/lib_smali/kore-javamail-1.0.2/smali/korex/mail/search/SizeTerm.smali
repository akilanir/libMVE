.class public final Lkorex/mail/search/SizeTerm;
.super Lkorex/mail/search/IntegerComparisonTerm;
.source "SizeTerm.java"


# static fields
.field private static final serialVersionUID:J = -0x2379840c191a6e5dL


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "comparison"    # I
    .param p2, "size"    # I

    .prologue
    .line 62
    invoke-direct {p0, p1, p2}, Lkorex/mail/search/IntegerComparisonTerm;-><init>(II)V

    .line 63
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 90
    instance-of v0, p1, Lkorex/mail/search/SizeTerm;

    if-nez v0, :cond_6

    .line 91
    const/4 v0, 0x0

    .line 92
    :goto_5
    return v0

    :cond_6
    invoke-super {p0, p1}, Lkorex/mail/search/IntegerComparisonTerm;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public match(Lkorex/mail/Message;)Z
    .registers 6
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    const/4 v2, 0x0

    .line 75
    :try_start_1
    invoke-virtual {p1}, Lkorex/mail/Message;->getSize()I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4} :catch_9

    move-result v1

    .line 80
    .local v1, "size":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_b

    .line 83
    .end local v1    # "size":I
    :goto_8
    return v2

    .line 76
    :catch_9
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_8

    .line 83
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "size":I
    :cond_b
    invoke-super {p0, v1}, Lkorex/mail/search/IntegerComparisonTerm;->match(I)Z

    move-result v2

    goto :goto_8
.end method
