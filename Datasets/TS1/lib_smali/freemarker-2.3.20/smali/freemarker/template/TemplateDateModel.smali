.class public interface abstract Lfreemarker/template/TemplateDateModel;
.super Ljava/lang/Object;
.source "TemplateDateModel.java"

# interfaces
.implements Lfreemarker/template/TemplateModel;


# static fields
.field public static final DATE:I = 0x2

.field public static final DATETIME:I = 0x3

.field public static final TIME:I = 0x1

.field public static final TYPE_NAMES:Ljava/util/List;

.field public static final UNKNOWN:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 90
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "UNKNOWN"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "TIME"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "DATE"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "DATETIME"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lfreemarker/template/TemplateDateModel;->TYPE_NAMES:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public abstract getAsDate()Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation
.end method

.method public abstract getDateType()I
.end method
