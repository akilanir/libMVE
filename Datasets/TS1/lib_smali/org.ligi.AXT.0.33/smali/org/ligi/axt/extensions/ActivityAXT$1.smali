.class Lorg/ligi/axt/extensions/ActivityAXT$1;
.super Ljava/lang/Object;
.source "ActivityAXT.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/ligi/axt/extensions/ActivityAXT;->rethrowIntentExcludingSelf()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/ligi/axt/extensions/ActivityAXT;

.field final synthetic val$component:Landroid/content/ComponentName;


# direct methods
.method constructor <init>(Lorg/ligi/axt/extensions/ActivityAXT;Landroid/content/ComponentName;)V
    .registers 3
    .param p1, "this$0"    # Lorg/ligi/axt/extensions/ActivityAXT;

    .prologue
    .line 87
    iput-object p1, p0, Lorg/ligi/axt/extensions/ActivityAXT$1;->this$0:Lorg/ligi/axt/extensions/ActivityAXT;

    iput-object p2, p0, Lorg/ligi/axt/extensions/ActivityAXT$1;->val$component:Landroid/content/ComponentName;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 90
    iget-object v0, p0, Lorg/ligi/axt/extensions/ActivityAXT$1;->this$0:Lorg/ligi/axt/extensions/ActivityAXT;

    # getter for: Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;
    invoke-static {v0}, Lorg/ligi/axt/extensions/ActivityAXT;->access$000(Lorg/ligi/axt/extensions/ActivityAXT;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lorg/ligi/axt/extensions/ActivityAXT$1;->val$component:Landroid/content/ComponentName;

    .line 91
    invoke-virtual {v0, v1, v2, v2}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 92
    iget-object v0, p0, Lorg/ligi/axt/extensions/ActivityAXT$1;->this$0:Lorg/ligi/axt/extensions/ActivityAXT;

    # getter for: Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;
    invoke-static {v0}, Lorg/ligi/axt/extensions/ActivityAXT;->access$000(Lorg/ligi/axt/extensions/ActivityAXT;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 93
    return-void
.end method
