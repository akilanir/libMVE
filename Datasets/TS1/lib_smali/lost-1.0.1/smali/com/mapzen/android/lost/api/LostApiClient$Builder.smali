.class public final Lcom/mapzen/android/lost/api/LostApiClient$Builder;
.super Ljava/lang/Object;
.source "LostApiClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mapzen/android/lost/api/LostApiClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/mapzen/android/lost/api/LostApiClient$Builder;->context:Landroid/content/Context;

    .line 20
    return-void
.end method


# virtual methods
.method public build()Lcom/mapzen/android/lost/api/LostApiClient;
    .registers 3

    .prologue
    .line 23
    new-instance v0, Lcom/mapzen/android/lost/internal/LostApiClientImpl;

    iget-object v1, p0, Lcom/mapzen/android/lost/api/LostApiClient$Builder;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/mapzen/android/lost/internal/LostApiClientImpl;-><init>(Landroid/content/Context;)V

    return-object v0
.end method
