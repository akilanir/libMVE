.class public Lch/qos/logback/core/pattern/util/RestrictedEscapeUtil;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/pattern/util/IEscapeUtil;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public escape(Ljava/lang/String;Ljava/lang/StringBuffer;CI)V
    .registers 6

    invoke-virtual {p1, p3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_a

    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :goto_9
    return-void

    :cond_a
    const-string v0, "\\"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_9
.end method
