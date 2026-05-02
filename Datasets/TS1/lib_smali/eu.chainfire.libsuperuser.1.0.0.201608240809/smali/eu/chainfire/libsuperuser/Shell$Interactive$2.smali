.class Leu/chainfire/libsuperuser/Shell$Interactive$2;
.super Ljava/lang/Object;
.source "Shell.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Leu/chainfire/libsuperuser/Shell$Interactive;->startWatchdog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Leu/chainfire/libsuperuser/Shell$Interactive;


# direct methods
.method constructor <init>(Leu/chainfire/libsuperuser/Shell$Interactive;)V
    .registers 2
    .param p1, "this$0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 1279
    iput-object p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive$2;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 1282
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive$2;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    # invokes: Leu/chainfire/libsuperuser/Shell$Interactive;->handleWatchdog()V
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1200(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    .line 1283
    return-void
.end method
