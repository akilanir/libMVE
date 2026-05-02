.class Ljp/wasabeef/richeditor/RichEditor$1;
.super Ljava/lang/Object;
.source "RichEditor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljp/wasabeef/richeditor/RichEditor;

.field final synthetic val$trigger:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljp/wasabeef/richeditor/RichEditor;Ljava/lang/String;)V
    .registers 3
    .param p1, "this$0"    # Ljp/wasabeef/richeditor/RichEditor;

    .prologue
    .line 388
    iput-object p1, p0, Ljp/wasabeef/richeditor/RichEditor$1;->this$0:Ljp/wasabeef/richeditor/RichEditor;

    iput-object p2, p0, Ljp/wasabeef/richeditor/RichEditor$1;->val$trigger:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 390
    iget-object v0, p0, Ljp/wasabeef/richeditor/RichEditor$1;->this$0:Ljp/wasabeef/richeditor/RichEditor;

    iget-object v1, p0, Ljp/wasabeef/richeditor/RichEditor$1;->val$trigger:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljp/wasabeef/richeditor/RichEditor;->exec(Ljava/lang/String;)V

    .line 391
    return-void
.end method
