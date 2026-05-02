.class public Lch/qos/logback/core/sift/DefaultDiscriminator;
.super Lch/qos/logback/core/sift/AbstractDiscriminator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/sift/AbstractDiscriminator",
        "<TE;>;"
    }
.end annotation


# static fields
.field public static final DEFAULT:Ljava/lang/String; = "default"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/sift/AbstractDiscriminator;-><init>()V

    return-void
.end method


# virtual methods
.method public getDiscriminatingValue(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "default"

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .registers 2

    const-string v0, "default"

    return-object v0
.end method
