.class Lorg/tukaani/xz/DeltaEncoder;
.super Lorg/tukaani/xz/DeltaCoder;

# interfaces
.implements Lorg/tukaani/xz/FilterEncoder;


# instance fields
.field private final options:Lorg/tukaani/xz/DeltaOptions;

.field private final props:[B


# direct methods
.method constructor <init>(Lorg/tukaani/xz/DeltaOptions;)V
    .registers 5

    invoke-direct {p0}, Lorg/tukaani/xz/DeltaCoder;-><init>()V

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/DeltaEncoder;->props:[B

    iget-object v0, p0, Lorg/tukaani/xz/DeltaEncoder;->props:[B

    const/4 v1, 0x0

    invoke-virtual {p1}, Lorg/tukaani/xz/DeltaOptions;->getDistance()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    invoke-virtual {p1}, Lorg/tukaani/xz/DeltaOptions;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/tukaani/xz/DeltaOptions;

    iput-object v0, p0, Lorg/tukaani/xz/DeltaEncoder;->options:Lorg/tukaani/xz/DeltaOptions;

    return-void
.end method


# virtual methods
.method public getFilterID()J
    .registers 3

    const-wide/16 v0, 0x3

    return-wide v0
.end method

.method public getFilterProps()[B
    .registers 2

    iget-object v0, p0, Lorg/tukaani/xz/DeltaEncoder;->props:[B

    return-object v0
.end method

.method public getOutputStream(Lorg/tukaani/xz/FinishableOutputStream;)Lorg/tukaani/xz/FinishableOutputStream;
    .registers 3

    iget-object v0, p0, Lorg/tukaani/xz/DeltaEncoder;->options:Lorg/tukaani/xz/DeltaOptions;

    invoke-virtual {v0, p1}, Lorg/tukaani/xz/DeltaOptions;->getOutputStream(Lorg/tukaani/xz/FinishableOutputStream;)Lorg/tukaani/xz/FinishableOutputStream;

    move-result-object v0

    return-object v0
.end method

.method public supportsFlushing()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method
