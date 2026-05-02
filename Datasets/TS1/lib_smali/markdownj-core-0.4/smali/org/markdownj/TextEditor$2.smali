.class Lorg/markdownj/TextEditor$2;
.super Ljava/lang/Object;
.source "TextEditor.java"

# interfaces
.implements Lorg/markdownj/Replacement;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/markdownj/TextEditor;->detabify(I)Lorg/markdownj/TextEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/markdownj/TextEditor;

.field final synthetic val$tabWidth:I


# direct methods
.method constructor <init>(Lorg/markdownj/TextEditor;I)V
    .registers 3

    .prologue
    .line 158
    iput-object p1, p0, Lorg/markdownj/TextEditor$2;->this$0:Lorg/markdownj/TextEditor;

    iput p2, p0, Lorg/markdownj/TextEditor$2;->val$tabWidth:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public replacement(Ljava/util/regex/Matcher;)Ljava/lang/String;
    .registers 6
    .param p1, "m"    # Ljava/util/regex/Matcher;

    .prologue
    .line 160
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 161
    .local v0, "lineSoFar":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    .line 162
    .local v2, "width":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 164
    .local v1, "replacement":Ljava/lang/StringBuilder;
    :cond_e
    const/16 v3, 0x20

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 165
    add-int/lit8 v2, v2, 0x1

    .line 166
    iget v3, p0, Lorg/markdownj/TextEditor$2;->val$tabWidth:I

    rem-int v3, v2, v3

    if-nez v3, :cond_e

    .line 167
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
