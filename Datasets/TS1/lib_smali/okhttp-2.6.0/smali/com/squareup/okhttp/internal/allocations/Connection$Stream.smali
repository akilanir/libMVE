.class public Lcom/squareup/okhttp/internal/allocations/Connection$Stream;
.super Ljava/lang/Object;
.source "Connection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/allocations/Connection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Stream"
.end annotation


# instance fields
.field public final name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 223
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 224
    iput-object p1, p0, Lcom/squareup/okhttp/internal/allocations/Connection$Stream;->name:Ljava/lang/String;

    .line 225
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$Stream;->name:Ljava/lang/String;

    return-object v0
.end method
