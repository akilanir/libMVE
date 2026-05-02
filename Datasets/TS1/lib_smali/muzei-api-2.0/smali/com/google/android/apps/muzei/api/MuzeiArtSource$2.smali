.class Lcom/google/android/apps/muzei/api/MuzeiArtSource$2;
.super Ljava/lang/Object;
.source "MuzeiArtSource.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/muzei/api/MuzeiArtSource;->publishCurrentState(Landroid/content/ComponentName;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/apps/muzei/api/MuzeiArtSource;

.field final synthetic val$subscriber:Landroid/content/ComponentName;


# direct methods
.method constructor <init>(Lcom/google/android/apps/muzei/api/MuzeiArtSource;Landroid/content/ComponentName;)V
    .registers 3

    .prologue
    .line 706
    iput-object p1, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource$2;->this$0:Lcom/google/android/apps/muzei/api/MuzeiArtSource;

    iput-object p2, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource$2;->val$subscriber:Landroid/content/ComponentName;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 709
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource$2;->this$0:Lcom/google/android/apps/muzei/api/MuzeiArtSource;

    iget-object v1, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource$2;->val$subscriber:Landroid/content/ComponentName;

    const/4 v2, 0x0

    # invokes: Lcom/google/android/apps/muzei/api/MuzeiArtSource;->processSubscribe(Landroid/content/ComponentName;Ljava/lang/String;)V
    invoke-static {v0, v1, v2}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->access$200(Lcom/google/android/apps/muzei/api/MuzeiArtSource;Landroid/content/ComponentName;Ljava/lang/String;)V

    .line 710
    return-void
.end method
