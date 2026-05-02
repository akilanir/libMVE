.class Lcom/mapzen/android/lost/internal/MockEngine$TraceThread$1;
.super Ljava/lang/Object;
.source "MockEngine.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->postMockLocation(Landroid/location/Location;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;

.field final synthetic val$mockLocation:Landroid/location/Location;


# direct methods
.method constructor <init>(Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;Landroid/location/Location;)V
    .registers 3

    .prologue
    .line 148
    iput-object p1, p0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread$1;->this$1:Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;

    iput-object p2, p0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread$1;->val$mockLocation:Landroid/location/Location;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 151
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread$1;->this$1:Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;

    # getter for: Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->canceled:Z
    invoke-static {v0}, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->access$200(Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;)Z

    move-result v0

    if-nez v0, :cond_11

    .line 152
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread$1;->this$1:Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;

    iget-object v0, v0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->this$0:Lcom/mapzen/android/lost/internal/MockEngine;

    iget-object v1, p0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread$1;->val$mockLocation:Landroid/location/Location;

    invoke-virtual {v0, v1}, Lcom/mapzen/android/lost/internal/MockEngine;->setLocation(Landroid/location/Location;)V

    .line 154
    :cond_11
    return-void
.end method
