.class final Lfreemarker/template/utility/DateUtil$1;
.super Ljava/lang/Object;
.source "DateUtil.java"

# interfaces
.implements Lfreemarker/template/utility/DateUtil$TimeZoneOffsetCalculator;


# instance fields
.field private final val$e:Ljava/lang/Throwable;


# direct methods
.method constructor <init>(Ljava/lang/Throwable;)V
    .registers 2

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/template/utility/DateUtil$1;->val$e:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public getOffset(Ljava/util/TimeZone;Ljava/util/Date;)I
    .registers 6
    .param p1, "tz"    # Ljava/util/TimeZone;
    .param p2, "date"    # Ljava/util/Date;

    .prologue
    .line 81
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Failed to create TimeZoneOffsetCalculator. Note that this feature requires at least Java 1.4.\nCause exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/template/utility/DateUtil$1;->val$e:Ljava/lang/Throwable;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
