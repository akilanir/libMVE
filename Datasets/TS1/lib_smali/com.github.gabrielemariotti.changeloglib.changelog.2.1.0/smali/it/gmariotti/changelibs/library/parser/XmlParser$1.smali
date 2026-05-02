.class final Lit/gmariotti/changelibs/library/parser/XmlParser$1;
.super Ljava/util/ArrayList;
.source "XmlParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/gmariotti/changelibs/library/parser/XmlParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 98
    const-string v0, "changelogbug"

    invoke-virtual {p0, v0}, Lit/gmariotti/changelibs/library/parser/XmlParser$1;->add(Ljava/lang/Object;)Z

    .line 99
    const-string v0, "changelogimprovement"

    invoke-virtual {p0, v0}, Lit/gmariotti/changelibs/library/parser/XmlParser$1;->add(Ljava/lang/Object;)Z

    .line 100
    const-string v0, "changelogtext"

    invoke-virtual {p0, v0}, Lit/gmariotti/changelibs/library/parser/XmlParser$1;->add(Ljava/lang/Object;)Z

    .line 101
    return-void
.end method
