.class public Lbrut/androlib/res/decoder/ResAttrDecoder;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public decode(IILjava/lang/String;I)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lbrut/androlib/AndrolibException;
        }
    .end annotation

    if-eqz p3, :cond_3

    :goto_2
    return-object p3

    :cond_3
    const-string p3, ""

    goto :goto_2
.end method
