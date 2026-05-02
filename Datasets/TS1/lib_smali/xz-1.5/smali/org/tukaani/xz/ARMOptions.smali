.class public Lorg/tukaani/xz/ARMOptions;
.super Lorg/tukaani/xz/BCJOptions;


# static fields
.field private static final ALIGNMENT:I = 0x4


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/tukaani/xz/BCJOptions;-><init>(I)V

    return-void
.end method


# virtual methods
.method getFilterEncoder()Lorg/tukaani/xz/FilterEncoder;
    .registers 4

    new-instance v0, Lorg/tukaani/xz/BCJEncoder;

    const-wide/16 v1, 0x7

    invoke-direct {v0, p0, v1, v2}, Lorg/tukaani/xz/BCJEncoder;-><init>(Lorg/tukaani/xz/BCJOptions;J)V

    return-object v0
.end method

.method public getInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;
    .registers 6

    new-instance v0, Lorg/tukaani/xz/SimpleInputStream;

    new-instance v1, Lorg/tukaani/xz/simple/ARM;

    const/4 v2, 0x0

    iget v3, p0, Lorg/tukaani/xz/ARMOptions;->startOffset:I

    invoke-direct {v1, v2, v3}, Lorg/tukaani/xz/simple/ARM;-><init>(ZI)V

    invoke-direct {v0, p1, v1}, Lorg/tukaani/xz/SimpleInputStream;-><init>(Ljava/io/InputStream;Lorg/tukaani/xz/simple/SimpleFilter;)V

    return-object v0
.end method

.method public getOutputStream(Lorg/tukaani/xz/FinishableOutputStream;)Lorg/tukaani/xz/FinishableOutputStream;
    .registers 6

    new-instance v0, Lorg/tukaani/xz/SimpleOutputStream;

    new-instance v1, Lorg/tukaani/xz/simple/ARM;

    const/4 v2, 0x1

    iget v3, p0, Lorg/tukaani/xz/ARMOptions;->startOffset:I

    invoke-direct {v1, v2, v3}, Lorg/tukaani/xz/simple/ARM;-><init>(ZI)V

    invoke-direct {v0, p1, v1}, Lorg/tukaani/xz/SimpleOutputStream;-><init>(Lorg/tukaani/xz/FinishableOutputStream;Lorg/tukaani/xz/simple/SimpleFilter;)V

    return-object v0
.end method
