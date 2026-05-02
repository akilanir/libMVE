.class public Lorg/tukaani/xz/check/None;
.super Lorg/tukaani/xz/check/Check;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lorg/tukaani/xz/check/Check;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lorg/tukaani/xz/check/None;->size:I

    const-string v0, "None"

    iput-object v0, p0, Lorg/tukaani/xz/check/None;->name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public finish()[B
    .registers 2

    const/4 v0, 0x0

    new-array v0, v0, [B

    return-object v0
.end method

.method public update([BII)V
    .registers 4

    return-void
.end method
