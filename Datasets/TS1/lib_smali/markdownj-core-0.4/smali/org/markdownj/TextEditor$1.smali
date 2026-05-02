.class Lorg/markdownj/TextEditor$1;
.super Ljava/lang/Object;
.source "TextEditor.java"

# interfaces
.implements Lorg/markdownj/Replacement;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/markdownj/TextEditor;->replaceAllLiteral(Ljava/lang/String;Ljava/lang/String;)Lorg/markdownj/TextEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/markdownj/TextEditor;

.field final synthetic val$replacement:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/markdownj/TextEditor;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 101
    iput-object p1, p0, Lorg/markdownj/TextEditor$1;->this$0:Lorg/markdownj/TextEditor;

    iput-object p2, p0, Lorg/markdownj/TextEditor$1;->val$replacement:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
    .registers 3
    .param p1, "m"    # Ljava/util/regex/Matcher;

    .prologue
    .line 103
    iget-object v0, p0, Lorg/markdownj/TextEditor$1;->val$replacement:Ljava/lang/String;

    return-object v0
.end method
