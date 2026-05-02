.class public Lorg/openintents/openpgp/util/OpenPgpUtils$UserId;
.super Ljava/lang/Object;
.source "OpenPgpUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/util/OpenPgpUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UserId"
.end annotation


# instance fields
.field public final comment:Ljava/lang/String;

.field public final email:Ljava/lang/String;

.field public final name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "email"    # Ljava/lang/String;
    .param p3, "comment"    # Ljava/lang/String;

    .prologue
    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpUtils$UserId;->name:Ljava/lang/String;

    .line 123
    iput-object p2, p0, Lorg/openintents/openpgp/util/OpenPgpUtils$UserId;->email:Ljava/lang/String;

    .line 124
    iput-object p3, p0, Lorg/openintents/openpgp/util/OpenPgpUtils$UserId;->comment:Ljava/lang/String;

    .line 125
    return-void
.end method
