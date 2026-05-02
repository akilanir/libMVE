.class Lorg/unbescape/html/HtmlEscapeSymbols$1;
.super Ljava/lang/Object;
.source "HtmlEscapeSymbols.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/unbescape/html/HtmlEscapeSymbols;-><init>(Lorg/unbescape/html/HtmlEscapeSymbols$References;[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<[C>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/unbescape/html/HtmlEscapeSymbols;


# direct methods
.method constructor <init>(Lorg/unbescape/html/HtmlEscapeSymbols;)V
    .registers 2
    .param p1, "this$0"    # Lorg/unbescape/html/HtmlEscapeSymbols;

    .prologue
    .line 252
    iput-object p1, p0, Lorg/unbescape/html/HtmlEscapeSymbols$1;->this$0:Lorg/unbescape/html/HtmlEscapeSymbols;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .prologue
    .line 252
    check-cast p1, [C

    check-cast p2, [C

    invoke-virtual {p0, p1, p2}, Lorg/unbescape/html/HtmlEscapeSymbols$1;->compare([C[C)I

    move-result v0

    return v0
.end method

.method public compare([C[C)I
    .registers 5
    .param p1, "o1"    # [C
    .param p2, "o2"    # [C

    .prologue
    .line 254
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([C)V

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p2}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method
