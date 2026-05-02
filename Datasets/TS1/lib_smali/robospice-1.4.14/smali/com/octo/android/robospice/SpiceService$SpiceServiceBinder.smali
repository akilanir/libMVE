.class public Lcom/octo/android/robospice/SpiceService$SpiceServiceBinder;
.super Landroid/os/Binder;
.source "SpiceService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/octo/android/robospice/SpiceService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SpiceServiceBinder"
.end annotation


# instance fields
.field private final spiceService:Lcom/octo/android/robospice/SpiceService;


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/SpiceService;)V
    .registers 2
    .param p1, "spiceService"    # Lcom/octo/android/robospice/SpiceService;

    .prologue
    .line 473
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 474
    iput-object p1, p0, Lcom/octo/android/robospice/SpiceService$SpiceServiceBinder;->spiceService:Lcom/octo/android/robospice/SpiceService;

    .line 475
    return-void
.end method


# virtual methods
.method public getSpiceService()Lcom/octo/android/robospice/SpiceService;
    .registers 2

    .prologue
    .line 478
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService$SpiceServiceBinder;->spiceService:Lcom/octo/android/robospice/SpiceService;

    return-object v0
.end method
