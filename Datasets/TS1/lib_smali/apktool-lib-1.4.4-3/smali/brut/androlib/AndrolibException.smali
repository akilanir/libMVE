.class public Lbrut/androlib/AndrolibException;
.super Lbrut/common/BrutException;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lbrut/common/BrutException;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lbrut/common/BrutException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lbrut/common/BrutException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2

    invoke-direct {p0, p1}, Lbrut/common/BrutException;-><init>(Ljava/lang/Throwable;)V

    return-void
.end method
