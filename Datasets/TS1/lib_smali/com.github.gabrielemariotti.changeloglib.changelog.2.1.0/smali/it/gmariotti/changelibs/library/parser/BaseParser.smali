.class public abstract Lit/gmariotti/changelibs/library/parser/BaseParser;
.super Ljava/lang/Object;
.source "BaseParser.java"


# instance fields
.field protected bulletedList:Z

.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lit/gmariotti/changelibs/library/parser/BaseParser;->mContext:Landroid/content/Context;

    .line 51
    return-void
.end method


# virtual methods
.method public abstract readChangeLogFile()Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
