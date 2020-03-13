// ORM class for table 'W_SL_LD_DMS_PURCHASE_ORDER_1'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Thu Jul 11 10:14:24 CST 2019
// For connector: org.apache.sqoop.manager.OracleManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class W_SL_LD_DMS_PURCHASE_ORDER_1 extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("HEAD_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        HEAD_ID = (String)value;
      }
    });
    setters.put("LINE_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        LINE_ID = (String)value;
      }
    });
    setters.put("DEALER_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DEALER_ID = (String)value;
      }
    });
    setters.put("AMOUNT_SUMMARY", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        AMOUNT_SUMMARY = (java.math.BigDecimal)value;
      }
    });
    setters.put("APPROVE_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        APPROVE_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("COLLECT_NUMBER", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        COLLECT_NUMBER = (java.math.BigDecimal)value;
      }
    });
    setters.put("DELIVERY_WAREHOUSE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DELIVERY_WAREHOUSE = (String)value;
      }
    });
    setters.put("INDENT_FLAG", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        INDENT_FLAG = (String)value;
      }
    });
    setters.put("ERPNO", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ERPNO = (String)value;
      }
    });
    setters.put("ERPID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ERPID = (String)value;
      }
    });
    setters.put("OU_TYPE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        OU_TYPE = (String)value;
      }
    });
    setters.put("PLAN_SHIP_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        PLAN_SHIP_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("SHIP_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        SHIP_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("ERP_ORDER_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ERP_ORDER_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("ORDERTYPE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ORDERTYPE = (String)value;
      }
    });
    setters.put("SOURCE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        SOURCE = (String)value;
      }
    });
    setters.put("PRODUCT_NO", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        PRODUCT_NO = (String)value;
      }
    });
    setters.put("GIFT_FLAG", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        GIFT_FLAG = (String)value;
      }
    });
    setters.put("QUANTITY", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        QUANTITY = (java.math.BigDecimal)value;
      }
    });
    setters.put("ROW_MONEY", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ROW_MONEY = (java.math.BigDecimal)value;
      }
    });
    setters.put("SUPPLY_PRICE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        SUPPLY_PRICE = (java.math.BigDecimal)value;
      }
    });
    setters.put("MEASURE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        MEASURE = (String)value;
      }
    });
    setters.put("QUANTITYSEND", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        QUANTITYSEND = (java.math.BigDecimal)value;
      }
    });
    setters.put("QUANTITYBUY", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        QUANTITYBUY = (java.math.BigDecimal)value;
      }
    });
    setters.put("STATE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        STATE = (String)value;
      }
    });
    setters.put("QUANTITYRECEIVED", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        QUANTITYRECEIVED = (java.math.BigDecimal)value;
      }
    });
    setters.put("ERP_LINE_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ERP_LINE_ID = (String)value;
      }
    });
    setters.put("ERP_DEALER_CODE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ERP_DEALER_CODE = (String)value;
      }
    });
    setters.put("BG_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        BG_NAME = (String)value;
      }
    });
    setters.put("TON", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        TON = (java.math.BigDecimal)value;
      }
    });
    setters.put("ORDERNO", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ORDERNO = (String)value;
      }
    });
    setters.put("ORDER_DATE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ORDER_DATE = (java.sql.Timestamp)value;
      }
    });
    setters.put("SHIP_CYCLE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        SHIP_CYCLE = (java.math.BigDecimal)value;
      }
    });
    setters.put("LAST_UPDATE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        LAST_UPDATE = (java.sql.Timestamp)value;
      }
    });
    setters.put("DATASOURCE_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DATASOURCE_ID = (String)value;
      }
    });
    setters.put("W_INSERT_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        W_INSERT_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("QUANTITYBUY_TON", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        QUANTITYBUY_TON = (java.math.BigDecimal)value;
      }
    });
    setters.put("AUDIT_QUANTITY_TON", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        AUDIT_QUANTITY_TON = (java.math.BigDecimal)value;
      }
    });
    setters.put("AUDIT_QUANTITY", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        AUDIT_QUANTITY = (java.math.BigDecimal)value;
      }
    });
    setters.put("AUDIT_QUANTITY_PACK", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        AUDIT_QUANTITY_PACK = (java.math.BigDecimal)value;
      }
    });
    setters.put("QUANTITY_PACK", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        QUANTITY_PACK = (java.math.BigDecimal)value;
      }
    });
    setters.put("QUANTITY_BUY_PACK", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        QUANTITY_BUY_PACK = (java.math.BigDecimal)value;
      }
    });
    setters.put("LINE_LAST_UPDATE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        LINE_LAST_UPDATE = (String)value;
      }
    });
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1() {
    init0();
  }
  private String HEAD_ID;
  public String get_HEAD_ID() {
    return HEAD_ID;
  }
  public void set_HEAD_ID(String HEAD_ID) {
    this.HEAD_ID = HEAD_ID;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_HEAD_ID(String HEAD_ID) {
    this.HEAD_ID = HEAD_ID;
    return this;
  }
  private String LINE_ID;
  public String get_LINE_ID() {
    return LINE_ID;
  }
  public void set_LINE_ID(String LINE_ID) {
    this.LINE_ID = LINE_ID;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_LINE_ID(String LINE_ID) {
    this.LINE_ID = LINE_ID;
    return this;
  }
  private String DEALER_ID;
  public String get_DEALER_ID() {
    return DEALER_ID;
  }
  public void set_DEALER_ID(String DEALER_ID) {
    this.DEALER_ID = DEALER_ID;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_DEALER_ID(String DEALER_ID) {
    this.DEALER_ID = DEALER_ID;
    return this;
  }
  private java.math.BigDecimal AMOUNT_SUMMARY;
  public java.math.BigDecimal get_AMOUNT_SUMMARY() {
    return AMOUNT_SUMMARY;
  }
  public void set_AMOUNT_SUMMARY(java.math.BigDecimal AMOUNT_SUMMARY) {
    this.AMOUNT_SUMMARY = AMOUNT_SUMMARY;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_AMOUNT_SUMMARY(java.math.BigDecimal AMOUNT_SUMMARY) {
    this.AMOUNT_SUMMARY = AMOUNT_SUMMARY;
    return this;
  }
  private java.sql.Timestamp APPROVE_DT;
  public java.sql.Timestamp get_APPROVE_DT() {
    return APPROVE_DT;
  }
  public void set_APPROVE_DT(java.sql.Timestamp APPROVE_DT) {
    this.APPROVE_DT = APPROVE_DT;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_APPROVE_DT(java.sql.Timestamp APPROVE_DT) {
    this.APPROVE_DT = APPROVE_DT;
    return this;
  }
  private java.math.BigDecimal COLLECT_NUMBER;
  public java.math.BigDecimal get_COLLECT_NUMBER() {
    return COLLECT_NUMBER;
  }
  public void set_COLLECT_NUMBER(java.math.BigDecimal COLLECT_NUMBER) {
    this.COLLECT_NUMBER = COLLECT_NUMBER;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_COLLECT_NUMBER(java.math.BigDecimal COLLECT_NUMBER) {
    this.COLLECT_NUMBER = COLLECT_NUMBER;
    return this;
  }
  private String DELIVERY_WAREHOUSE;
  public String get_DELIVERY_WAREHOUSE() {
    return DELIVERY_WAREHOUSE;
  }
  public void set_DELIVERY_WAREHOUSE(String DELIVERY_WAREHOUSE) {
    this.DELIVERY_WAREHOUSE = DELIVERY_WAREHOUSE;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_DELIVERY_WAREHOUSE(String DELIVERY_WAREHOUSE) {
    this.DELIVERY_WAREHOUSE = DELIVERY_WAREHOUSE;
    return this;
  }
  private String INDENT_FLAG;
  public String get_INDENT_FLAG() {
    return INDENT_FLAG;
  }
  public void set_INDENT_FLAG(String INDENT_FLAG) {
    this.INDENT_FLAG = INDENT_FLAG;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_INDENT_FLAG(String INDENT_FLAG) {
    this.INDENT_FLAG = INDENT_FLAG;
    return this;
  }
  private String ERPNO;
  public String get_ERPNO() {
    return ERPNO;
  }
  public void set_ERPNO(String ERPNO) {
    this.ERPNO = ERPNO;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_ERPNO(String ERPNO) {
    this.ERPNO = ERPNO;
    return this;
  }
  private String ERPID;
  public String get_ERPID() {
    return ERPID;
  }
  public void set_ERPID(String ERPID) {
    this.ERPID = ERPID;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_ERPID(String ERPID) {
    this.ERPID = ERPID;
    return this;
  }
  private String OU_TYPE;
  public String get_OU_TYPE() {
    return OU_TYPE;
  }
  public void set_OU_TYPE(String OU_TYPE) {
    this.OU_TYPE = OU_TYPE;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_OU_TYPE(String OU_TYPE) {
    this.OU_TYPE = OU_TYPE;
    return this;
  }
  private java.sql.Timestamp PLAN_SHIP_DT;
  public java.sql.Timestamp get_PLAN_SHIP_DT() {
    return PLAN_SHIP_DT;
  }
  public void set_PLAN_SHIP_DT(java.sql.Timestamp PLAN_SHIP_DT) {
    this.PLAN_SHIP_DT = PLAN_SHIP_DT;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_PLAN_SHIP_DT(java.sql.Timestamp PLAN_SHIP_DT) {
    this.PLAN_SHIP_DT = PLAN_SHIP_DT;
    return this;
  }
  private java.sql.Timestamp SHIP_DT;
  public java.sql.Timestamp get_SHIP_DT() {
    return SHIP_DT;
  }
  public void set_SHIP_DT(java.sql.Timestamp SHIP_DT) {
    this.SHIP_DT = SHIP_DT;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_SHIP_DT(java.sql.Timestamp SHIP_DT) {
    this.SHIP_DT = SHIP_DT;
    return this;
  }
  private java.sql.Timestamp ERP_ORDER_DT;
  public java.sql.Timestamp get_ERP_ORDER_DT() {
    return ERP_ORDER_DT;
  }
  public void set_ERP_ORDER_DT(java.sql.Timestamp ERP_ORDER_DT) {
    this.ERP_ORDER_DT = ERP_ORDER_DT;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_ERP_ORDER_DT(java.sql.Timestamp ERP_ORDER_DT) {
    this.ERP_ORDER_DT = ERP_ORDER_DT;
    return this;
  }
  private String ORDERTYPE;
  public String get_ORDERTYPE() {
    return ORDERTYPE;
  }
  public void set_ORDERTYPE(String ORDERTYPE) {
    this.ORDERTYPE = ORDERTYPE;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_ORDERTYPE(String ORDERTYPE) {
    this.ORDERTYPE = ORDERTYPE;
    return this;
  }
  private String SOURCE;
  public String get_SOURCE() {
    return SOURCE;
  }
  public void set_SOURCE(String SOURCE) {
    this.SOURCE = SOURCE;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_SOURCE(String SOURCE) {
    this.SOURCE = SOURCE;
    return this;
  }
  private String PRODUCT_NO;
  public String get_PRODUCT_NO() {
    return PRODUCT_NO;
  }
  public void set_PRODUCT_NO(String PRODUCT_NO) {
    this.PRODUCT_NO = PRODUCT_NO;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_PRODUCT_NO(String PRODUCT_NO) {
    this.PRODUCT_NO = PRODUCT_NO;
    return this;
  }
  private String GIFT_FLAG;
  public String get_GIFT_FLAG() {
    return GIFT_FLAG;
  }
  public void set_GIFT_FLAG(String GIFT_FLAG) {
    this.GIFT_FLAG = GIFT_FLAG;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_GIFT_FLAG(String GIFT_FLAG) {
    this.GIFT_FLAG = GIFT_FLAG;
    return this;
  }
  private java.math.BigDecimal QUANTITY;
  public java.math.BigDecimal get_QUANTITY() {
    return QUANTITY;
  }
  public void set_QUANTITY(java.math.BigDecimal QUANTITY) {
    this.QUANTITY = QUANTITY;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_QUANTITY(java.math.BigDecimal QUANTITY) {
    this.QUANTITY = QUANTITY;
    return this;
  }
  private java.math.BigDecimal ROW_MONEY;
  public java.math.BigDecimal get_ROW_MONEY() {
    return ROW_MONEY;
  }
  public void set_ROW_MONEY(java.math.BigDecimal ROW_MONEY) {
    this.ROW_MONEY = ROW_MONEY;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_ROW_MONEY(java.math.BigDecimal ROW_MONEY) {
    this.ROW_MONEY = ROW_MONEY;
    return this;
  }
  private java.math.BigDecimal SUPPLY_PRICE;
  public java.math.BigDecimal get_SUPPLY_PRICE() {
    return SUPPLY_PRICE;
  }
  public void set_SUPPLY_PRICE(java.math.BigDecimal SUPPLY_PRICE) {
    this.SUPPLY_PRICE = SUPPLY_PRICE;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_SUPPLY_PRICE(java.math.BigDecimal SUPPLY_PRICE) {
    this.SUPPLY_PRICE = SUPPLY_PRICE;
    return this;
  }
  private String MEASURE;
  public String get_MEASURE() {
    return MEASURE;
  }
  public void set_MEASURE(String MEASURE) {
    this.MEASURE = MEASURE;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_MEASURE(String MEASURE) {
    this.MEASURE = MEASURE;
    return this;
  }
  private java.math.BigDecimal QUANTITYSEND;
  public java.math.BigDecimal get_QUANTITYSEND() {
    return QUANTITYSEND;
  }
  public void set_QUANTITYSEND(java.math.BigDecimal QUANTITYSEND) {
    this.QUANTITYSEND = QUANTITYSEND;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_QUANTITYSEND(java.math.BigDecimal QUANTITYSEND) {
    this.QUANTITYSEND = QUANTITYSEND;
    return this;
  }
  private java.math.BigDecimal QUANTITYBUY;
  public java.math.BigDecimal get_QUANTITYBUY() {
    return QUANTITYBUY;
  }
  public void set_QUANTITYBUY(java.math.BigDecimal QUANTITYBUY) {
    this.QUANTITYBUY = QUANTITYBUY;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_QUANTITYBUY(java.math.BigDecimal QUANTITYBUY) {
    this.QUANTITYBUY = QUANTITYBUY;
    return this;
  }
  private String STATE;
  public String get_STATE() {
    return STATE;
  }
  public void set_STATE(String STATE) {
    this.STATE = STATE;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_STATE(String STATE) {
    this.STATE = STATE;
    return this;
  }
  private java.math.BigDecimal QUANTITYRECEIVED;
  public java.math.BigDecimal get_QUANTITYRECEIVED() {
    return QUANTITYRECEIVED;
  }
  public void set_QUANTITYRECEIVED(java.math.BigDecimal QUANTITYRECEIVED) {
    this.QUANTITYRECEIVED = QUANTITYRECEIVED;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_QUANTITYRECEIVED(java.math.BigDecimal QUANTITYRECEIVED) {
    this.QUANTITYRECEIVED = QUANTITYRECEIVED;
    return this;
  }
  private String ERP_LINE_ID;
  public String get_ERP_LINE_ID() {
    return ERP_LINE_ID;
  }
  public void set_ERP_LINE_ID(String ERP_LINE_ID) {
    this.ERP_LINE_ID = ERP_LINE_ID;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_ERP_LINE_ID(String ERP_LINE_ID) {
    this.ERP_LINE_ID = ERP_LINE_ID;
    return this;
  }
  private String ERP_DEALER_CODE;
  public String get_ERP_DEALER_CODE() {
    return ERP_DEALER_CODE;
  }
  public void set_ERP_DEALER_CODE(String ERP_DEALER_CODE) {
    this.ERP_DEALER_CODE = ERP_DEALER_CODE;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_ERP_DEALER_CODE(String ERP_DEALER_CODE) {
    this.ERP_DEALER_CODE = ERP_DEALER_CODE;
    return this;
  }
  private String BG_NAME;
  public String get_BG_NAME() {
    return BG_NAME;
  }
  public void set_BG_NAME(String BG_NAME) {
    this.BG_NAME = BG_NAME;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_BG_NAME(String BG_NAME) {
    this.BG_NAME = BG_NAME;
    return this;
  }
  private java.math.BigDecimal TON;
  public java.math.BigDecimal get_TON() {
    return TON;
  }
  public void set_TON(java.math.BigDecimal TON) {
    this.TON = TON;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_TON(java.math.BigDecimal TON) {
    this.TON = TON;
    return this;
  }
  private String ORDERNO;
  public String get_ORDERNO() {
    return ORDERNO;
  }
  public void set_ORDERNO(String ORDERNO) {
    this.ORDERNO = ORDERNO;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_ORDERNO(String ORDERNO) {
    this.ORDERNO = ORDERNO;
    return this;
  }
  private java.sql.Timestamp ORDER_DATE;
  public java.sql.Timestamp get_ORDER_DATE() {
    return ORDER_DATE;
  }
  public void set_ORDER_DATE(java.sql.Timestamp ORDER_DATE) {
    this.ORDER_DATE = ORDER_DATE;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_ORDER_DATE(java.sql.Timestamp ORDER_DATE) {
    this.ORDER_DATE = ORDER_DATE;
    return this;
  }
  private java.math.BigDecimal SHIP_CYCLE;
  public java.math.BigDecimal get_SHIP_CYCLE() {
    return SHIP_CYCLE;
  }
  public void set_SHIP_CYCLE(java.math.BigDecimal SHIP_CYCLE) {
    this.SHIP_CYCLE = SHIP_CYCLE;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_SHIP_CYCLE(java.math.BigDecimal SHIP_CYCLE) {
    this.SHIP_CYCLE = SHIP_CYCLE;
    return this;
  }
  private java.sql.Timestamp LAST_UPDATE;
  public java.sql.Timestamp get_LAST_UPDATE() {
    return LAST_UPDATE;
  }
  public void set_LAST_UPDATE(java.sql.Timestamp LAST_UPDATE) {
    this.LAST_UPDATE = LAST_UPDATE;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_LAST_UPDATE(java.sql.Timestamp LAST_UPDATE) {
    this.LAST_UPDATE = LAST_UPDATE;
    return this;
  }
  private String DATASOURCE_ID;
  public String get_DATASOURCE_ID() {
    return DATASOURCE_ID;
  }
  public void set_DATASOURCE_ID(String DATASOURCE_ID) {
    this.DATASOURCE_ID = DATASOURCE_ID;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_DATASOURCE_ID(String DATASOURCE_ID) {
    this.DATASOURCE_ID = DATASOURCE_ID;
    return this;
  }
  private java.sql.Timestamp W_INSERT_DT;
  public java.sql.Timestamp get_W_INSERT_DT() {
    return W_INSERT_DT;
  }
  public void set_W_INSERT_DT(java.sql.Timestamp W_INSERT_DT) {
    this.W_INSERT_DT = W_INSERT_DT;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_W_INSERT_DT(java.sql.Timestamp W_INSERT_DT) {
    this.W_INSERT_DT = W_INSERT_DT;
    return this;
  }
  private java.math.BigDecimal QUANTITYBUY_TON;
  public java.math.BigDecimal get_QUANTITYBUY_TON() {
    return QUANTITYBUY_TON;
  }
  public void set_QUANTITYBUY_TON(java.math.BigDecimal QUANTITYBUY_TON) {
    this.QUANTITYBUY_TON = QUANTITYBUY_TON;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_QUANTITYBUY_TON(java.math.BigDecimal QUANTITYBUY_TON) {
    this.QUANTITYBUY_TON = QUANTITYBUY_TON;
    return this;
  }
  private java.math.BigDecimal AUDIT_QUANTITY_TON;
  public java.math.BigDecimal get_AUDIT_QUANTITY_TON() {
    return AUDIT_QUANTITY_TON;
  }
  public void set_AUDIT_QUANTITY_TON(java.math.BigDecimal AUDIT_QUANTITY_TON) {
    this.AUDIT_QUANTITY_TON = AUDIT_QUANTITY_TON;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_AUDIT_QUANTITY_TON(java.math.BigDecimal AUDIT_QUANTITY_TON) {
    this.AUDIT_QUANTITY_TON = AUDIT_QUANTITY_TON;
    return this;
  }
  private java.math.BigDecimal AUDIT_QUANTITY;
  public java.math.BigDecimal get_AUDIT_QUANTITY() {
    return AUDIT_QUANTITY;
  }
  public void set_AUDIT_QUANTITY(java.math.BigDecimal AUDIT_QUANTITY) {
    this.AUDIT_QUANTITY = AUDIT_QUANTITY;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_AUDIT_QUANTITY(java.math.BigDecimal AUDIT_QUANTITY) {
    this.AUDIT_QUANTITY = AUDIT_QUANTITY;
    return this;
  }
  private java.math.BigDecimal AUDIT_QUANTITY_PACK;
  public java.math.BigDecimal get_AUDIT_QUANTITY_PACK() {
    return AUDIT_QUANTITY_PACK;
  }
  public void set_AUDIT_QUANTITY_PACK(java.math.BigDecimal AUDIT_QUANTITY_PACK) {
    this.AUDIT_QUANTITY_PACK = AUDIT_QUANTITY_PACK;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_AUDIT_QUANTITY_PACK(java.math.BigDecimal AUDIT_QUANTITY_PACK) {
    this.AUDIT_QUANTITY_PACK = AUDIT_QUANTITY_PACK;
    return this;
  }
  private java.math.BigDecimal QUANTITY_PACK;
  public java.math.BigDecimal get_QUANTITY_PACK() {
    return QUANTITY_PACK;
  }
  public void set_QUANTITY_PACK(java.math.BigDecimal QUANTITY_PACK) {
    this.QUANTITY_PACK = QUANTITY_PACK;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_QUANTITY_PACK(java.math.BigDecimal QUANTITY_PACK) {
    this.QUANTITY_PACK = QUANTITY_PACK;
    return this;
  }
  private java.math.BigDecimal QUANTITY_BUY_PACK;
  public java.math.BigDecimal get_QUANTITY_BUY_PACK() {
    return QUANTITY_BUY_PACK;
  }
  public void set_QUANTITY_BUY_PACK(java.math.BigDecimal QUANTITY_BUY_PACK) {
    this.QUANTITY_BUY_PACK = QUANTITY_BUY_PACK;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_QUANTITY_BUY_PACK(java.math.BigDecimal QUANTITY_BUY_PACK) {
    this.QUANTITY_BUY_PACK = QUANTITY_BUY_PACK;
    return this;
  }
  private String LINE_LAST_UPDATE;
  public String get_LINE_LAST_UPDATE() {
    return LINE_LAST_UPDATE;
  }
  public void set_LINE_LAST_UPDATE(String LINE_LAST_UPDATE) {
    this.LINE_LAST_UPDATE = LINE_LAST_UPDATE;
  }
  public W_SL_LD_DMS_PURCHASE_ORDER_1 with_LINE_LAST_UPDATE(String LINE_LAST_UPDATE) {
    this.LINE_LAST_UPDATE = LINE_LAST_UPDATE;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof W_SL_LD_DMS_PURCHASE_ORDER_1)) {
      return false;
    }
    W_SL_LD_DMS_PURCHASE_ORDER_1 that = (W_SL_LD_DMS_PURCHASE_ORDER_1) o;
    boolean equal = true;
    equal = equal && (this.HEAD_ID == null ? that.HEAD_ID == null : this.HEAD_ID.equals(that.HEAD_ID));
    equal = equal && (this.LINE_ID == null ? that.LINE_ID == null : this.LINE_ID.equals(that.LINE_ID));
    equal = equal && (this.DEALER_ID == null ? that.DEALER_ID == null : this.DEALER_ID.equals(that.DEALER_ID));
    equal = equal && (this.AMOUNT_SUMMARY == null ? that.AMOUNT_SUMMARY == null : this.AMOUNT_SUMMARY.equals(that.AMOUNT_SUMMARY));
    equal = equal && (this.APPROVE_DT == null ? that.APPROVE_DT == null : this.APPROVE_DT.equals(that.APPROVE_DT));
    equal = equal && (this.COLLECT_NUMBER == null ? that.COLLECT_NUMBER == null : this.COLLECT_NUMBER.equals(that.COLLECT_NUMBER));
    equal = equal && (this.DELIVERY_WAREHOUSE == null ? that.DELIVERY_WAREHOUSE == null : this.DELIVERY_WAREHOUSE.equals(that.DELIVERY_WAREHOUSE));
    equal = equal && (this.INDENT_FLAG == null ? that.INDENT_FLAG == null : this.INDENT_FLAG.equals(that.INDENT_FLAG));
    equal = equal && (this.ERPNO == null ? that.ERPNO == null : this.ERPNO.equals(that.ERPNO));
    equal = equal && (this.ERPID == null ? that.ERPID == null : this.ERPID.equals(that.ERPID));
    equal = equal && (this.OU_TYPE == null ? that.OU_TYPE == null : this.OU_TYPE.equals(that.OU_TYPE));
    equal = equal && (this.PLAN_SHIP_DT == null ? that.PLAN_SHIP_DT == null : this.PLAN_SHIP_DT.equals(that.PLAN_SHIP_DT));
    equal = equal && (this.SHIP_DT == null ? that.SHIP_DT == null : this.SHIP_DT.equals(that.SHIP_DT));
    equal = equal && (this.ERP_ORDER_DT == null ? that.ERP_ORDER_DT == null : this.ERP_ORDER_DT.equals(that.ERP_ORDER_DT));
    equal = equal && (this.ORDERTYPE == null ? that.ORDERTYPE == null : this.ORDERTYPE.equals(that.ORDERTYPE));
    equal = equal && (this.SOURCE == null ? that.SOURCE == null : this.SOURCE.equals(that.SOURCE));
    equal = equal && (this.PRODUCT_NO == null ? that.PRODUCT_NO == null : this.PRODUCT_NO.equals(that.PRODUCT_NO));
    equal = equal && (this.GIFT_FLAG == null ? that.GIFT_FLAG == null : this.GIFT_FLAG.equals(that.GIFT_FLAG));
    equal = equal && (this.QUANTITY == null ? that.QUANTITY == null : this.QUANTITY.equals(that.QUANTITY));
    equal = equal && (this.ROW_MONEY == null ? that.ROW_MONEY == null : this.ROW_MONEY.equals(that.ROW_MONEY));
    equal = equal && (this.SUPPLY_PRICE == null ? that.SUPPLY_PRICE == null : this.SUPPLY_PRICE.equals(that.SUPPLY_PRICE));
    equal = equal && (this.MEASURE == null ? that.MEASURE == null : this.MEASURE.equals(that.MEASURE));
    equal = equal && (this.QUANTITYSEND == null ? that.QUANTITYSEND == null : this.QUANTITYSEND.equals(that.QUANTITYSEND));
    equal = equal && (this.QUANTITYBUY == null ? that.QUANTITYBUY == null : this.QUANTITYBUY.equals(that.QUANTITYBUY));
    equal = equal && (this.STATE == null ? that.STATE == null : this.STATE.equals(that.STATE));
    equal = equal && (this.QUANTITYRECEIVED == null ? that.QUANTITYRECEIVED == null : this.QUANTITYRECEIVED.equals(that.QUANTITYRECEIVED));
    equal = equal && (this.ERP_LINE_ID == null ? that.ERP_LINE_ID == null : this.ERP_LINE_ID.equals(that.ERP_LINE_ID));
    equal = equal && (this.ERP_DEALER_CODE == null ? that.ERP_DEALER_CODE == null : this.ERP_DEALER_CODE.equals(that.ERP_DEALER_CODE));
    equal = equal && (this.BG_NAME == null ? that.BG_NAME == null : this.BG_NAME.equals(that.BG_NAME));
    equal = equal && (this.TON == null ? that.TON == null : this.TON.equals(that.TON));
    equal = equal && (this.ORDERNO == null ? that.ORDERNO == null : this.ORDERNO.equals(that.ORDERNO));
    equal = equal && (this.ORDER_DATE == null ? that.ORDER_DATE == null : this.ORDER_DATE.equals(that.ORDER_DATE));
    equal = equal && (this.SHIP_CYCLE == null ? that.SHIP_CYCLE == null : this.SHIP_CYCLE.equals(that.SHIP_CYCLE));
    equal = equal && (this.LAST_UPDATE == null ? that.LAST_UPDATE == null : this.LAST_UPDATE.equals(that.LAST_UPDATE));
    equal = equal && (this.DATASOURCE_ID == null ? that.DATASOURCE_ID == null : this.DATASOURCE_ID.equals(that.DATASOURCE_ID));
    equal = equal && (this.W_INSERT_DT == null ? that.W_INSERT_DT == null : this.W_INSERT_DT.equals(that.W_INSERT_DT));
    equal = equal && (this.QUANTITYBUY_TON == null ? that.QUANTITYBUY_TON == null : this.QUANTITYBUY_TON.equals(that.QUANTITYBUY_TON));
    equal = equal && (this.AUDIT_QUANTITY_TON == null ? that.AUDIT_QUANTITY_TON == null : this.AUDIT_QUANTITY_TON.equals(that.AUDIT_QUANTITY_TON));
    equal = equal && (this.AUDIT_QUANTITY == null ? that.AUDIT_QUANTITY == null : this.AUDIT_QUANTITY.equals(that.AUDIT_QUANTITY));
    equal = equal && (this.AUDIT_QUANTITY_PACK == null ? that.AUDIT_QUANTITY_PACK == null : this.AUDIT_QUANTITY_PACK.equals(that.AUDIT_QUANTITY_PACK));
    equal = equal && (this.QUANTITY_PACK == null ? that.QUANTITY_PACK == null : this.QUANTITY_PACK.equals(that.QUANTITY_PACK));
    equal = equal && (this.QUANTITY_BUY_PACK == null ? that.QUANTITY_BUY_PACK == null : this.QUANTITY_BUY_PACK.equals(that.QUANTITY_BUY_PACK));
    equal = equal && (this.LINE_LAST_UPDATE == null ? that.LINE_LAST_UPDATE == null : this.LINE_LAST_UPDATE.equals(that.LINE_LAST_UPDATE));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof W_SL_LD_DMS_PURCHASE_ORDER_1)) {
      return false;
    }
    W_SL_LD_DMS_PURCHASE_ORDER_1 that = (W_SL_LD_DMS_PURCHASE_ORDER_1) o;
    boolean equal = true;
    equal = equal && (this.HEAD_ID == null ? that.HEAD_ID == null : this.HEAD_ID.equals(that.HEAD_ID));
    equal = equal && (this.LINE_ID == null ? that.LINE_ID == null : this.LINE_ID.equals(that.LINE_ID));
    equal = equal && (this.DEALER_ID == null ? that.DEALER_ID == null : this.DEALER_ID.equals(that.DEALER_ID));
    equal = equal && (this.AMOUNT_SUMMARY == null ? that.AMOUNT_SUMMARY == null : this.AMOUNT_SUMMARY.equals(that.AMOUNT_SUMMARY));
    equal = equal && (this.APPROVE_DT == null ? that.APPROVE_DT == null : this.APPROVE_DT.equals(that.APPROVE_DT));
    equal = equal && (this.COLLECT_NUMBER == null ? that.COLLECT_NUMBER == null : this.COLLECT_NUMBER.equals(that.COLLECT_NUMBER));
    equal = equal && (this.DELIVERY_WAREHOUSE == null ? that.DELIVERY_WAREHOUSE == null : this.DELIVERY_WAREHOUSE.equals(that.DELIVERY_WAREHOUSE));
    equal = equal && (this.INDENT_FLAG == null ? that.INDENT_FLAG == null : this.INDENT_FLAG.equals(that.INDENT_FLAG));
    equal = equal && (this.ERPNO == null ? that.ERPNO == null : this.ERPNO.equals(that.ERPNO));
    equal = equal && (this.ERPID == null ? that.ERPID == null : this.ERPID.equals(that.ERPID));
    equal = equal && (this.OU_TYPE == null ? that.OU_TYPE == null : this.OU_TYPE.equals(that.OU_TYPE));
    equal = equal && (this.PLAN_SHIP_DT == null ? that.PLAN_SHIP_DT == null : this.PLAN_SHIP_DT.equals(that.PLAN_SHIP_DT));
    equal = equal && (this.SHIP_DT == null ? that.SHIP_DT == null : this.SHIP_DT.equals(that.SHIP_DT));
    equal = equal && (this.ERP_ORDER_DT == null ? that.ERP_ORDER_DT == null : this.ERP_ORDER_DT.equals(that.ERP_ORDER_DT));
    equal = equal && (this.ORDERTYPE == null ? that.ORDERTYPE == null : this.ORDERTYPE.equals(that.ORDERTYPE));
    equal = equal && (this.SOURCE == null ? that.SOURCE == null : this.SOURCE.equals(that.SOURCE));
    equal = equal && (this.PRODUCT_NO == null ? that.PRODUCT_NO == null : this.PRODUCT_NO.equals(that.PRODUCT_NO));
    equal = equal && (this.GIFT_FLAG == null ? that.GIFT_FLAG == null : this.GIFT_FLAG.equals(that.GIFT_FLAG));
    equal = equal && (this.QUANTITY == null ? that.QUANTITY == null : this.QUANTITY.equals(that.QUANTITY));
    equal = equal && (this.ROW_MONEY == null ? that.ROW_MONEY == null : this.ROW_MONEY.equals(that.ROW_MONEY));
    equal = equal && (this.SUPPLY_PRICE == null ? that.SUPPLY_PRICE == null : this.SUPPLY_PRICE.equals(that.SUPPLY_PRICE));
    equal = equal && (this.MEASURE == null ? that.MEASURE == null : this.MEASURE.equals(that.MEASURE));
    equal = equal && (this.QUANTITYSEND == null ? that.QUANTITYSEND == null : this.QUANTITYSEND.equals(that.QUANTITYSEND));
    equal = equal && (this.QUANTITYBUY == null ? that.QUANTITYBUY == null : this.QUANTITYBUY.equals(that.QUANTITYBUY));
    equal = equal && (this.STATE == null ? that.STATE == null : this.STATE.equals(that.STATE));
    equal = equal && (this.QUANTITYRECEIVED == null ? that.QUANTITYRECEIVED == null : this.QUANTITYRECEIVED.equals(that.QUANTITYRECEIVED));
    equal = equal && (this.ERP_LINE_ID == null ? that.ERP_LINE_ID == null : this.ERP_LINE_ID.equals(that.ERP_LINE_ID));
    equal = equal && (this.ERP_DEALER_CODE == null ? that.ERP_DEALER_CODE == null : this.ERP_DEALER_CODE.equals(that.ERP_DEALER_CODE));
    equal = equal && (this.BG_NAME == null ? that.BG_NAME == null : this.BG_NAME.equals(that.BG_NAME));
    equal = equal && (this.TON == null ? that.TON == null : this.TON.equals(that.TON));
    equal = equal && (this.ORDERNO == null ? that.ORDERNO == null : this.ORDERNO.equals(that.ORDERNO));
    equal = equal && (this.ORDER_DATE == null ? that.ORDER_DATE == null : this.ORDER_DATE.equals(that.ORDER_DATE));
    equal = equal && (this.SHIP_CYCLE == null ? that.SHIP_CYCLE == null : this.SHIP_CYCLE.equals(that.SHIP_CYCLE));
    equal = equal && (this.LAST_UPDATE == null ? that.LAST_UPDATE == null : this.LAST_UPDATE.equals(that.LAST_UPDATE));
    equal = equal && (this.DATASOURCE_ID == null ? that.DATASOURCE_ID == null : this.DATASOURCE_ID.equals(that.DATASOURCE_ID));
    equal = equal && (this.W_INSERT_DT == null ? that.W_INSERT_DT == null : this.W_INSERT_DT.equals(that.W_INSERT_DT));
    equal = equal && (this.QUANTITYBUY_TON == null ? that.QUANTITYBUY_TON == null : this.QUANTITYBUY_TON.equals(that.QUANTITYBUY_TON));
    equal = equal && (this.AUDIT_QUANTITY_TON == null ? that.AUDIT_QUANTITY_TON == null : this.AUDIT_QUANTITY_TON.equals(that.AUDIT_QUANTITY_TON));
    equal = equal && (this.AUDIT_QUANTITY == null ? that.AUDIT_QUANTITY == null : this.AUDIT_QUANTITY.equals(that.AUDIT_QUANTITY));
    equal = equal && (this.AUDIT_QUANTITY_PACK == null ? that.AUDIT_QUANTITY_PACK == null : this.AUDIT_QUANTITY_PACK.equals(that.AUDIT_QUANTITY_PACK));
    equal = equal && (this.QUANTITY_PACK == null ? that.QUANTITY_PACK == null : this.QUANTITY_PACK.equals(that.QUANTITY_PACK));
    equal = equal && (this.QUANTITY_BUY_PACK == null ? that.QUANTITY_BUY_PACK == null : this.QUANTITY_BUY_PACK.equals(that.QUANTITY_BUY_PACK));
    equal = equal && (this.LINE_LAST_UPDATE == null ? that.LINE_LAST_UPDATE == null : this.LINE_LAST_UPDATE.equals(that.LINE_LAST_UPDATE));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.HEAD_ID = JdbcWritableBridge.readString(1, __dbResults);
    this.LINE_ID = JdbcWritableBridge.readString(2, __dbResults);
    this.DEALER_ID = JdbcWritableBridge.readString(3, __dbResults);
    this.AMOUNT_SUMMARY = JdbcWritableBridge.readBigDecimal(4, __dbResults);
    this.APPROVE_DT = JdbcWritableBridge.readTimestamp(5, __dbResults);
    this.COLLECT_NUMBER = JdbcWritableBridge.readBigDecimal(6, __dbResults);
    this.DELIVERY_WAREHOUSE = JdbcWritableBridge.readString(7, __dbResults);
    this.INDENT_FLAG = JdbcWritableBridge.readString(8, __dbResults);
    this.ERPNO = JdbcWritableBridge.readString(9, __dbResults);
    this.ERPID = JdbcWritableBridge.readString(10, __dbResults);
    this.OU_TYPE = JdbcWritableBridge.readString(11, __dbResults);
    this.PLAN_SHIP_DT = JdbcWritableBridge.readTimestamp(12, __dbResults);
    this.SHIP_DT = JdbcWritableBridge.readTimestamp(13, __dbResults);
    this.ERP_ORDER_DT = JdbcWritableBridge.readTimestamp(14, __dbResults);
    this.ORDERTYPE = JdbcWritableBridge.readString(15, __dbResults);
    this.SOURCE = JdbcWritableBridge.readString(16, __dbResults);
    this.PRODUCT_NO = JdbcWritableBridge.readString(17, __dbResults);
    this.GIFT_FLAG = JdbcWritableBridge.readString(18, __dbResults);
    this.QUANTITY = JdbcWritableBridge.readBigDecimal(19, __dbResults);
    this.ROW_MONEY = JdbcWritableBridge.readBigDecimal(20, __dbResults);
    this.SUPPLY_PRICE = JdbcWritableBridge.readBigDecimal(21, __dbResults);
    this.MEASURE = JdbcWritableBridge.readString(22, __dbResults);
    this.QUANTITYSEND = JdbcWritableBridge.readBigDecimal(23, __dbResults);
    this.QUANTITYBUY = JdbcWritableBridge.readBigDecimal(24, __dbResults);
    this.STATE = JdbcWritableBridge.readString(25, __dbResults);
    this.QUANTITYRECEIVED = JdbcWritableBridge.readBigDecimal(26, __dbResults);
    this.ERP_LINE_ID = JdbcWritableBridge.readString(27, __dbResults);
    this.ERP_DEALER_CODE = JdbcWritableBridge.readString(28, __dbResults);
    this.BG_NAME = JdbcWritableBridge.readString(29, __dbResults);
    this.TON = JdbcWritableBridge.readBigDecimal(30, __dbResults);
    this.ORDERNO = JdbcWritableBridge.readString(31, __dbResults);
    this.ORDER_DATE = JdbcWritableBridge.readTimestamp(32, __dbResults);
    this.SHIP_CYCLE = JdbcWritableBridge.readBigDecimal(33, __dbResults);
    this.LAST_UPDATE = JdbcWritableBridge.readTimestamp(34, __dbResults);
    this.DATASOURCE_ID = JdbcWritableBridge.readString(35, __dbResults);
    this.W_INSERT_DT = JdbcWritableBridge.readTimestamp(36, __dbResults);
    this.QUANTITYBUY_TON = JdbcWritableBridge.readBigDecimal(37, __dbResults);
    this.AUDIT_QUANTITY_TON = JdbcWritableBridge.readBigDecimal(38, __dbResults);
    this.AUDIT_QUANTITY = JdbcWritableBridge.readBigDecimal(39, __dbResults);
    this.AUDIT_QUANTITY_PACK = JdbcWritableBridge.readBigDecimal(40, __dbResults);
    this.QUANTITY_PACK = JdbcWritableBridge.readBigDecimal(41, __dbResults);
    this.QUANTITY_BUY_PACK = JdbcWritableBridge.readBigDecimal(42, __dbResults);
    this.LINE_LAST_UPDATE = JdbcWritableBridge.readString(43, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.HEAD_ID = JdbcWritableBridge.readString(1, __dbResults);
    this.LINE_ID = JdbcWritableBridge.readString(2, __dbResults);
    this.DEALER_ID = JdbcWritableBridge.readString(3, __dbResults);
    this.AMOUNT_SUMMARY = JdbcWritableBridge.readBigDecimal(4, __dbResults);
    this.APPROVE_DT = JdbcWritableBridge.readTimestamp(5, __dbResults);
    this.COLLECT_NUMBER = JdbcWritableBridge.readBigDecimal(6, __dbResults);
    this.DELIVERY_WAREHOUSE = JdbcWritableBridge.readString(7, __dbResults);
    this.INDENT_FLAG = JdbcWritableBridge.readString(8, __dbResults);
    this.ERPNO = JdbcWritableBridge.readString(9, __dbResults);
    this.ERPID = JdbcWritableBridge.readString(10, __dbResults);
    this.OU_TYPE = JdbcWritableBridge.readString(11, __dbResults);
    this.PLAN_SHIP_DT = JdbcWritableBridge.readTimestamp(12, __dbResults);
    this.SHIP_DT = JdbcWritableBridge.readTimestamp(13, __dbResults);
    this.ERP_ORDER_DT = JdbcWritableBridge.readTimestamp(14, __dbResults);
    this.ORDERTYPE = JdbcWritableBridge.readString(15, __dbResults);
    this.SOURCE = JdbcWritableBridge.readString(16, __dbResults);
    this.PRODUCT_NO = JdbcWritableBridge.readString(17, __dbResults);
    this.GIFT_FLAG = JdbcWritableBridge.readString(18, __dbResults);
    this.QUANTITY = JdbcWritableBridge.readBigDecimal(19, __dbResults);
    this.ROW_MONEY = JdbcWritableBridge.readBigDecimal(20, __dbResults);
    this.SUPPLY_PRICE = JdbcWritableBridge.readBigDecimal(21, __dbResults);
    this.MEASURE = JdbcWritableBridge.readString(22, __dbResults);
    this.QUANTITYSEND = JdbcWritableBridge.readBigDecimal(23, __dbResults);
    this.QUANTITYBUY = JdbcWritableBridge.readBigDecimal(24, __dbResults);
    this.STATE = JdbcWritableBridge.readString(25, __dbResults);
    this.QUANTITYRECEIVED = JdbcWritableBridge.readBigDecimal(26, __dbResults);
    this.ERP_LINE_ID = JdbcWritableBridge.readString(27, __dbResults);
    this.ERP_DEALER_CODE = JdbcWritableBridge.readString(28, __dbResults);
    this.BG_NAME = JdbcWritableBridge.readString(29, __dbResults);
    this.TON = JdbcWritableBridge.readBigDecimal(30, __dbResults);
    this.ORDERNO = JdbcWritableBridge.readString(31, __dbResults);
    this.ORDER_DATE = JdbcWritableBridge.readTimestamp(32, __dbResults);
    this.SHIP_CYCLE = JdbcWritableBridge.readBigDecimal(33, __dbResults);
    this.LAST_UPDATE = JdbcWritableBridge.readTimestamp(34, __dbResults);
    this.DATASOURCE_ID = JdbcWritableBridge.readString(35, __dbResults);
    this.W_INSERT_DT = JdbcWritableBridge.readTimestamp(36, __dbResults);
    this.QUANTITYBUY_TON = JdbcWritableBridge.readBigDecimal(37, __dbResults);
    this.AUDIT_QUANTITY_TON = JdbcWritableBridge.readBigDecimal(38, __dbResults);
    this.AUDIT_QUANTITY = JdbcWritableBridge.readBigDecimal(39, __dbResults);
    this.AUDIT_QUANTITY_PACK = JdbcWritableBridge.readBigDecimal(40, __dbResults);
    this.QUANTITY_PACK = JdbcWritableBridge.readBigDecimal(41, __dbResults);
    this.QUANTITY_BUY_PACK = JdbcWritableBridge.readBigDecimal(42, __dbResults);
    this.LINE_LAST_UPDATE = JdbcWritableBridge.readString(43, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(HEAD_ID, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(LINE_ID, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_ID, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(AMOUNT_SUMMARY, 4 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(APPROVE_DT, 5 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(COLLECT_NUMBER, 6 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(DELIVERY_WAREHOUSE, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(INDENT_FLAG, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ERPNO, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ERPID, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(OU_TYPE, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(PLAN_SHIP_DT, 12 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(SHIP_DT, 13 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(ERP_ORDER_DT, 14 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(ORDERTYPE, 15 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(SOURCE, 16 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(PRODUCT_NO, 17 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(GIFT_FLAG, 18 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITY, 19 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(ROW_MONEY, 20 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(SUPPLY_PRICE, 21 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(MEASURE, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITYSEND, 23 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITYBUY, 24 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(STATE, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITYRECEIVED, 26 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(ERP_LINE_ID, 27 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ERP_DEALER_CODE, 28 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_NAME, 29 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(TON, 30 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(ORDERNO, 31 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(ORDER_DATE, 32 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(SHIP_CYCLE, 33 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(LAST_UPDATE, 34 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(DATASOURCE_ID, 35 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_INSERT_DT, 36 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITYBUY_TON, 37 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(AUDIT_QUANTITY_TON, 38 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(AUDIT_QUANTITY, 39 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(AUDIT_QUANTITY_PACK, 40 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITY_PACK, 41 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITY_BUY_PACK, 42 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(LINE_LAST_UPDATE, 43 + __off, 12, __dbStmt);
    return 43;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(HEAD_ID, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(LINE_ID, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_ID, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(AMOUNT_SUMMARY, 4 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(APPROVE_DT, 5 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(COLLECT_NUMBER, 6 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(DELIVERY_WAREHOUSE, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(INDENT_FLAG, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ERPNO, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ERPID, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(OU_TYPE, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(PLAN_SHIP_DT, 12 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(SHIP_DT, 13 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(ERP_ORDER_DT, 14 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(ORDERTYPE, 15 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(SOURCE, 16 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(PRODUCT_NO, 17 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(GIFT_FLAG, 18 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITY, 19 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(ROW_MONEY, 20 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(SUPPLY_PRICE, 21 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(MEASURE, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITYSEND, 23 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITYBUY, 24 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(STATE, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITYRECEIVED, 26 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(ERP_LINE_ID, 27 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ERP_DEALER_CODE, 28 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_NAME, 29 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(TON, 30 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(ORDERNO, 31 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(ORDER_DATE, 32 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(SHIP_CYCLE, 33 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(LAST_UPDATE, 34 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(DATASOURCE_ID, 35 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_INSERT_DT, 36 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITYBUY_TON, 37 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(AUDIT_QUANTITY_TON, 38 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(AUDIT_QUANTITY, 39 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(AUDIT_QUANTITY_PACK, 40 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITY_PACK, 41 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(QUANTITY_BUY_PACK, 42 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(LINE_LAST_UPDATE, 43 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.HEAD_ID = null;
    } else {
    this.HEAD_ID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.LINE_ID = null;
    } else {
    this.LINE_ID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DEALER_ID = null;
    } else {
    this.DEALER_ID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.AMOUNT_SUMMARY = null;
    } else {
    this.AMOUNT_SUMMARY = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.APPROVE_DT = null;
    } else {
    this.APPROVE_DT = new Timestamp(__dataIn.readLong());
    this.APPROVE_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.COLLECT_NUMBER = null;
    } else {
    this.COLLECT_NUMBER = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DELIVERY_WAREHOUSE = null;
    } else {
    this.DELIVERY_WAREHOUSE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.INDENT_FLAG = null;
    } else {
    this.INDENT_FLAG = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ERPNO = null;
    } else {
    this.ERPNO = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ERPID = null;
    } else {
    this.ERPID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.OU_TYPE = null;
    } else {
    this.OU_TYPE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.PLAN_SHIP_DT = null;
    } else {
    this.PLAN_SHIP_DT = new Timestamp(__dataIn.readLong());
    this.PLAN_SHIP_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.SHIP_DT = null;
    } else {
    this.SHIP_DT = new Timestamp(__dataIn.readLong());
    this.SHIP_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.ERP_ORDER_DT = null;
    } else {
    this.ERP_ORDER_DT = new Timestamp(__dataIn.readLong());
    this.ERP_ORDER_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.ORDERTYPE = null;
    } else {
    this.ORDERTYPE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.SOURCE = null;
    } else {
    this.SOURCE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.PRODUCT_NO = null;
    } else {
    this.PRODUCT_NO = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.GIFT_FLAG = null;
    } else {
    this.GIFT_FLAG = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.QUANTITY = null;
    } else {
    this.QUANTITY = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ROW_MONEY = null;
    } else {
    this.ROW_MONEY = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.SUPPLY_PRICE = null;
    } else {
    this.SUPPLY_PRICE = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.MEASURE = null;
    } else {
    this.MEASURE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.QUANTITYSEND = null;
    } else {
    this.QUANTITYSEND = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.QUANTITYBUY = null;
    } else {
    this.QUANTITYBUY = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.STATE = null;
    } else {
    this.STATE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.QUANTITYRECEIVED = null;
    } else {
    this.QUANTITYRECEIVED = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ERP_LINE_ID = null;
    } else {
    this.ERP_LINE_ID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ERP_DEALER_CODE = null;
    } else {
    this.ERP_DEALER_CODE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BG_NAME = null;
    } else {
    this.BG_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.TON = null;
    } else {
    this.TON = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ORDERNO = null;
    } else {
    this.ORDERNO = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ORDER_DATE = null;
    } else {
    this.ORDER_DATE = new Timestamp(__dataIn.readLong());
    this.ORDER_DATE.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.SHIP_CYCLE = null;
    } else {
    this.SHIP_CYCLE = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.LAST_UPDATE = null;
    } else {
    this.LAST_UPDATE = new Timestamp(__dataIn.readLong());
    this.LAST_UPDATE.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.DATASOURCE_ID = null;
    } else {
    this.DATASOURCE_ID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.W_INSERT_DT = null;
    } else {
    this.W_INSERT_DT = new Timestamp(__dataIn.readLong());
    this.W_INSERT_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.QUANTITYBUY_TON = null;
    } else {
    this.QUANTITYBUY_TON = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.AUDIT_QUANTITY_TON = null;
    } else {
    this.AUDIT_QUANTITY_TON = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.AUDIT_QUANTITY = null;
    } else {
    this.AUDIT_QUANTITY = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.AUDIT_QUANTITY_PACK = null;
    } else {
    this.AUDIT_QUANTITY_PACK = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.QUANTITY_PACK = null;
    } else {
    this.QUANTITY_PACK = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.QUANTITY_BUY_PACK = null;
    } else {
    this.QUANTITY_BUY_PACK = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.LINE_LAST_UPDATE = null;
    } else {
    this.LINE_LAST_UPDATE = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.HEAD_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, HEAD_ID);
    }
    if (null == this.LINE_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, LINE_ID);
    }
    if (null == this.DEALER_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_ID);
    }
    if (null == this.AMOUNT_SUMMARY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.AMOUNT_SUMMARY, __dataOut);
    }
    if (null == this.APPROVE_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.APPROVE_DT.getTime());
    __dataOut.writeInt(this.APPROVE_DT.getNanos());
    }
    if (null == this.COLLECT_NUMBER) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.COLLECT_NUMBER, __dataOut);
    }
    if (null == this.DELIVERY_WAREHOUSE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DELIVERY_WAREHOUSE);
    }
    if (null == this.INDENT_FLAG) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, INDENT_FLAG);
    }
    if (null == this.ERPNO) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ERPNO);
    }
    if (null == this.ERPID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ERPID);
    }
    if (null == this.OU_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, OU_TYPE);
    }
    if (null == this.PLAN_SHIP_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.PLAN_SHIP_DT.getTime());
    __dataOut.writeInt(this.PLAN_SHIP_DT.getNanos());
    }
    if (null == this.SHIP_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.SHIP_DT.getTime());
    __dataOut.writeInt(this.SHIP_DT.getNanos());
    }
    if (null == this.ERP_ORDER_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.ERP_ORDER_DT.getTime());
    __dataOut.writeInt(this.ERP_ORDER_DT.getNanos());
    }
    if (null == this.ORDERTYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ORDERTYPE);
    }
    if (null == this.SOURCE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, SOURCE);
    }
    if (null == this.PRODUCT_NO) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, PRODUCT_NO);
    }
    if (null == this.GIFT_FLAG) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, GIFT_FLAG);
    }
    if (null == this.QUANTITY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITY, __dataOut);
    }
    if (null == this.ROW_MONEY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.ROW_MONEY, __dataOut);
    }
    if (null == this.SUPPLY_PRICE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.SUPPLY_PRICE, __dataOut);
    }
    if (null == this.MEASURE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MEASURE);
    }
    if (null == this.QUANTITYSEND) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITYSEND, __dataOut);
    }
    if (null == this.QUANTITYBUY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITYBUY, __dataOut);
    }
    if (null == this.STATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, STATE);
    }
    if (null == this.QUANTITYRECEIVED) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITYRECEIVED, __dataOut);
    }
    if (null == this.ERP_LINE_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ERP_LINE_ID);
    }
    if (null == this.ERP_DEALER_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ERP_DEALER_CODE);
    }
    if (null == this.BG_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_NAME);
    }
    if (null == this.TON) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.TON, __dataOut);
    }
    if (null == this.ORDERNO) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ORDERNO);
    }
    if (null == this.ORDER_DATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.ORDER_DATE.getTime());
    __dataOut.writeInt(this.ORDER_DATE.getNanos());
    }
    if (null == this.SHIP_CYCLE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.SHIP_CYCLE, __dataOut);
    }
    if (null == this.LAST_UPDATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.LAST_UPDATE.getTime());
    __dataOut.writeInt(this.LAST_UPDATE.getNanos());
    }
    if (null == this.DATASOURCE_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DATASOURCE_ID);
    }
    if (null == this.W_INSERT_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.W_INSERT_DT.getTime());
    __dataOut.writeInt(this.W_INSERT_DT.getNanos());
    }
    if (null == this.QUANTITYBUY_TON) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITYBUY_TON, __dataOut);
    }
    if (null == this.AUDIT_QUANTITY_TON) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.AUDIT_QUANTITY_TON, __dataOut);
    }
    if (null == this.AUDIT_QUANTITY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.AUDIT_QUANTITY, __dataOut);
    }
    if (null == this.AUDIT_QUANTITY_PACK) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.AUDIT_QUANTITY_PACK, __dataOut);
    }
    if (null == this.QUANTITY_PACK) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITY_PACK, __dataOut);
    }
    if (null == this.QUANTITY_BUY_PACK) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITY_BUY_PACK, __dataOut);
    }
    if (null == this.LINE_LAST_UPDATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, LINE_LAST_UPDATE);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.HEAD_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, HEAD_ID);
    }
    if (null == this.LINE_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, LINE_ID);
    }
    if (null == this.DEALER_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_ID);
    }
    if (null == this.AMOUNT_SUMMARY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.AMOUNT_SUMMARY, __dataOut);
    }
    if (null == this.APPROVE_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.APPROVE_DT.getTime());
    __dataOut.writeInt(this.APPROVE_DT.getNanos());
    }
    if (null == this.COLLECT_NUMBER) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.COLLECT_NUMBER, __dataOut);
    }
    if (null == this.DELIVERY_WAREHOUSE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DELIVERY_WAREHOUSE);
    }
    if (null == this.INDENT_FLAG) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, INDENT_FLAG);
    }
    if (null == this.ERPNO) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ERPNO);
    }
    if (null == this.ERPID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ERPID);
    }
    if (null == this.OU_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, OU_TYPE);
    }
    if (null == this.PLAN_SHIP_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.PLAN_SHIP_DT.getTime());
    __dataOut.writeInt(this.PLAN_SHIP_DT.getNanos());
    }
    if (null == this.SHIP_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.SHIP_DT.getTime());
    __dataOut.writeInt(this.SHIP_DT.getNanos());
    }
    if (null == this.ERP_ORDER_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.ERP_ORDER_DT.getTime());
    __dataOut.writeInt(this.ERP_ORDER_DT.getNanos());
    }
    if (null == this.ORDERTYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ORDERTYPE);
    }
    if (null == this.SOURCE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, SOURCE);
    }
    if (null == this.PRODUCT_NO) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, PRODUCT_NO);
    }
    if (null == this.GIFT_FLAG) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, GIFT_FLAG);
    }
    if (null == this.QUANTITY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITY, __dataOut);
    }
    if (null == this.ROW_MONEY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.ROW_MONEY, __dataOut);
    }
    if (null == this.SUPPLY_PRICE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.SUPPLY_PRICE, __dataOut);
    }
    if (null == this.MEASURE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, MEASURE);
    }
    if (null == this.QUANTITYSEND) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITYSEND, __dataOut);
    }
    if (null == this.QUANTITYBUY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITYBUY, __dataOut);
    }
    if (null == this.STATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, STATE);
    }
    if (null == this.QUANTITYRECEIVED) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITYRECEIVED, __dataOut);
    }
    if (null == this.ERP_LINE_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ERP_LINE_ID);
    }
    if (null == this.ERP_DEALER_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ERP_DEALER_CODE);
    }
    if (null == this.BG_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_NAME);
    }
    if (null == this.TON) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.TON, __dataOut);
    }
    if (null == this.ORDERNO) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ORDERNO);
    }
    if (null == this.ORDER_DATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.ORDER_DATE.getTime());
    __dataOut.writeInt(this.ORDER_DATE.getNanos());
    }
    if (null == this.SHIP_CYCLE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.SHIP_CYCLE, __dataOut);
    }
    if (null == this.LAST_UPDATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.LAST_UPDATE.getTime());
    __dataOut.writeInt(this.LAST_UPDATE.getNanos());
    }
    if (null == this.DATASOURCE_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DATASOURCE_ID);
    }
    if (null == this.W_INSERT_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.W_INSERT_DT.getTime());
    __dataOut.writeInt(this.W_INSERT_DT.getNanos());
    }
    if (null == this.QUANTITYBUY_TON) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITYBUY_TON, __dataOut);
    }
    if (null == this.AUDIT_QUANTITY_TON) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.AUDIT_QUANTITY_TON, __dataOut);
    }
    if (null == this.AUDIT_QUANTITY) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.AUDIT_QUANTITY, __dataOut);
    }
    if (null == this.AUDIT_QUANTITY_PACK) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.AUDIT_QUANTITY_PACK, __dataOut);
    }
    if (null == this.QUANTITY_PACK) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITY_PACK, __dataOut);
    }
    if (null == this.QUANTITY_BUY_PACK) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.QUANTITY_BUY_PACK, __dataOut);
    }
    if (null == this.LINE_LAST_UPDATE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, LINE_LAST_UPDATE);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(HEAD_ID==null?"null":HEAD_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LINE_ID==null?"null":LINE_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_ID==null?"null":DEALER_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AMOUNT_SUMMARY==null?"null":AMOUNT_SUMMARY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(APPROVE_DT==null?"null":"" + APPROVE_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(COLLECT_NUMBER==null?"null":COLLECT_NUMBER.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DELIVERY_WAREHOUSE==null?"null":DELIVERY_WAREHOUSE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(INDENT_FLAG==null?"null":INDENT_FLAG, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ERPNO==null?"null":ERPNO, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ERPID==null?"null":ERPID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(OU_TYPE==null?"null":OU_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PLAN_SHIP_DT==null?"null":"" + PLAN_SHIP_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(SHIP_DT==null?"null":"" + SHIP_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ERP_ORDER_DT==null?"null":"" + ERP_ORDER_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORDERTYPE==null?"null":ORDERTYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(SOURCE==null?"null":SOURCE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PRODUCT_NO==null?"null":PRODUCT_NO, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(GIFT_FLAG==null?"null":GIFT_FLAG, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITY==null?"null":QUANTITY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ROW_MONEY==null?"null":ROW_MONEY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(SUPPLY_PRICE==null?"null":SUPPLY_PRICE.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MEASURE==null?"null":MEASURE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITYSEND==null?"null":QUANTITYSEND.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITYBUY==null?"null":QUANTITYBUY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(STATE==null?"null":STATE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITYRECEIVED==null?"null":QUANTITYRECEIVED.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ERP_LINE_ID==null?"null":ERP_LINE_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ERP_DEALER_CODE==null?"null":ERP_DEALER_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_NAME==null?"null":BG_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(TON==null?"null":TON.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORDERNO==null?"null":ORDERNO, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORDER_DATE==null?"null":"" + ORDER_DATE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(SHIP_CYCLE==null?"null":SHIP_CYCLE.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LAST_UPDATE==null?"null":"" + LAST_UPDATE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATASOURCE_ID==null?"null":DATASOURCE_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_INSERT_DT==null?"null":"" + W_INSERT_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITYBUY_TON==null?"null":QUANTITYBUY_TON.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUDIT_QUANTITY_TON==null?"null":AUDIT_QUANTITY_TON.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUDIT_QUANTITY==null?"null":AUDIT_QUANTITY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUDIT_QUANTITY_PACK==null?"null":AUDIT_QUANTITY_PACK.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITY_PACK==null?"null":QUANTITY_PACK.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITY_BUY_PACK==null?"null":QUANTITY_BUY_PACK.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LINE_LAST_UPDATE==null?"null":LINE_LAST_UPDATE, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(HEAD_ID==null?"null":HEAD_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LINE_ID==null?"null":LINE_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_ID==null?"null":DEALER_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AMOUNT_SUMMARY==null?"null":AMOUNT_SUMMARY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(APPROVE_DT==null?"null":"" + APPROVE_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(COLLECT_NUMBER==null?"null":COLLECT_NUMBER.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DELIVERY_WAREHOUSE==null?"null":DELIVERY_WAREHOUSE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(INDENT_FLAG==null?"null":INDENT_FLAG, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ERPNO==null?"null":ERPNO, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ERPID==null?"null":ERPID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(OU_TYPE==null?"null":OU_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PLAN_SHIP_DT==null?"null":"" + PLAN_SHIP_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(SHIP_DT==null?"null":"" + SHIP_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ERP_ORDER_DT==null?"null":"" + ERP_ORDER_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORDERTYPE==null?"null":ORDERTYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(SOURCE==null?"null":SOURCE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PRODUCT_NO==null?"null":PRODUCT_NO, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(GIFT_FLAG==null?"null":GIFT_FLAG, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITY==null?"null":QUANTITY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ROW_MONEY==null?"null":ROW_MONEY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(SUPPLY_PRICE==null?"null":SUPPLY_PRICE.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(MEASURE==null?"null":MEASURE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITYSEND==null?"null":QUANTITYSEND.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITYBUY==null?"null":QUANTITYBUY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(STATE==null?"null":STATE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITYRECEIVED==null?"null":QUANTITYRECEIVED.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ERP_LINE_ID==null?"null":ERP_LINE_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ERP_DEALER_CODE==null?"null":ERP_DEALER_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_NAME==null?"null":BG_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(TON==null?"null":TON.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORDERNO==null?"null":ORDERNO, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ORDER_DATE==null?"null":"" + ORDER_DATE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(SHIP_CYCLE==null?"null":SHIP_CYCLE.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LAST_UPDATE==null?"null":"" + LAST_UPDATE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATASOURCE_ID==null?"null":DATASOURCE_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_INSERT_DT==null?"null":"" + W_INSERT_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITYBUY_TON==null?"null":QUANTITYBUY_TON.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUDIT_QUANTITY_TON==null?"null":AUDIT_QUANTITY_TON.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUDIT_QUANTITY==null?"null":AUDIT_QUANTITY.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUDIT_QUANTITY_PACK==null?"null":AUDIT_QUANTITY_PACK.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITY_PACK==null?"null":QUANTITY_PACK.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(QUANTITY_BUY_PACK==null?"null":QUANTITY_BUY_PACK.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(LINE_LAST_UPDATE==null?"null":LINE_LAST_UPDATE, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.HEAD_ID = null; } else {
      this.HEAD_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.LINE_ID = null; } else {
      this.LINE_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_ID = null; } else {
      this.DEALER_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AMOUNT_SUMMARY = null; } else {
      this.AMOUNT_SUMMARY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.APPROVE_DT = null; } else {
      this.APPROVE_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.COLLECT_NUMBER = null; } else {
      this.COLLECT_NUMBER = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DELIVERY_WAREHOUSE = null; } else {
      this.DELIVERY_WAREHOUSE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.INDENT_FLAG = null; } else {
      this.INDENT_FLAG = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ERPNO = null; } else {
      this.ERPNO = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ERPID = null; } else {
      this.ERPID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.OU_TYPE = null; } else {
      this.OU_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.PLAN_SHIP_DT = null; } else {
      this.PLAN_SHIP_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.SHIP_DT = null; } else {
      this.SHIP_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ERP_ORDER_DT = null; } else {
      this.ERP_ORDER_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ORDERTYPE = null; } else {
      this.ORDERTYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.SOURCE = null; } else {
      this.SOURCE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.PRODUCT_NO = null; } else {
      this.PRODUCT_NO = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.GIFT_FLAG = null; } else {
      this.GIFT_FLAG = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITY = null; } else {
      this.QUANTITY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ROW_MONEY = null; } else {
      this.ROW_MONEY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.SUPPLY_PRICE = null; } else {
      this.SUPPLY_PRICE = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MEASURE = null; } else {
      this.MEASURE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITYSEND = null; } else {
      this.QUANTITYSEND = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITYBUY = null; } else {
      this.QUANTITYBUY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.STATE = null; } else {
      this.STATE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITYRECEIVED = null; } else {
      this.QUANTITYRECEIVED = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ERP_LINE_ID = null; } else {
      this.ERP_LINE_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ERP_DEALER_CODE = null; } else {
      this.ERP_DEALER_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_NAME = null; } else {
      this.BG_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.TON = null; } else {
      this.TON = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ORDERNO = null; } else {
      this.ORDERNO = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ORDER_DATE = null; } else {
      this.ORDER_DATE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.SHIP_CYCLE = null; } else {
      this.SHIP_CYCLE = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LAST_UPDATE = null; } else {
      this.LAST_UPDATE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DATASOURCE_ID = null; } else {
      this.DATASOURCE_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.W_INSERT_DT = null; } else {
      this.W_INSERT_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITYBUY_TON = null; } else {
      this.QUANTITYBUY_TON = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUDIT_QUANTITY_TON = null; } else {
      this.AUDIT_QUANTITY_TON = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUDIT_QUANTITY = null; } else {
      this.AUDIT_QUANTITY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUDIT_QUANTITY_PACK = null; } else {
      this.AUDIT_QUANTITY_PACK = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITY_PACK = null; } else {
      this.QUANTITY_PACK = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITY_BUY_PACK = null; } else {
      this.QUANTITY_BUY_PACK = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.LINE_LAST_UPDATE = null; } else {
      this.LINE_LAST_UPDATE = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.HEAD_ID = null; } else {
      this.HEAD_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.LINE_ID = null; } else {
      this.LINE_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_ID = null; } else {
      this.DEALER_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AMOUNT_SUMMARY = null; } else {
      this.AMOUNT_SUMMARY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.APPROVE_DT = null; } else {
      this.APPROVE_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.COLLECT_NUMBER = null; } else {
      this.COLLECT_NUMBER = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DELIVERY_WAREHOUSE = null; } else {
      this.DELIVERY_WAREHOUSE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.INDENT_FLAG = null; } else {
      this.INDENT_FLAG = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ERPNO = null; } else {
      this.ERPNO = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ERPID = null; } else {
      this.ERPID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.OU_TYPE = null; } else {
      this.OU_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.PLAN_SHIP_DT = null; } else {
      this.PLAN_SHIP_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.SHIP_DT = null; } else {
      this.SHIP_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ERP_ORDER_DT = null; } else {
      this.ERP_ORDER_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ORDERTYPE = null; } else {
      this.ORDERTYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.SOURCE = null; } else {
      this.SOURCE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.PRODUCT_NO = null; } else {
      this.PRODUCT_NO = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.GIFT_FLAG = null; } else {
      this.GIFT_FLAG = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITY = null; } else {
      this.QUANTITY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ROW_MONEY = null; } else {
      this.ROW_MONEY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.SUPPLY_PRICE = null; } else {
      this.SUPPLY_PRICE = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.MEASURE = null; } else {
      this.MEASURE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITYSEND = null; } else {
      this.QUANTITYSEND = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITYBUY = null; } else {
      this.QUANTITYBUY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.STATE = null; } else {
      this.STATE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITYRECEIVED = null; } else {
      this.QUANTITYRECEIVED = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ERP_LINE_ID = null; } else {
      this.ERP_LINE_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ERP_DEALER_CODE = null; } else {
      this.ERP_DEALER_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_NAME = null; } else {
      this.BG_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.TON = null; } else {
      this.TON = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ORDERNO = null; } else {
      this.ORDERNO = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ORDER_DATE = null; } else {
      this.ORDER_DATE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.SHIP_CYCLE = null; } else {
      this.SHIP_CYCLE = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.LAST_UPDATE = null; } else {
      this.LAST_UPDATE = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DATASOURCE_ID = null; } else {
      this.DATASOURCE_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.W_INSERT_DT = null; } else {
      this.W_INSERT_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITYBUY_TON = null; } else {
      this.QUANTITYBUY_TON = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUDIT_QUANTITY_TON = null; } else {
      this.AUDIT_QUANTITY_TON = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUDIT_QUANTITY = null; } else {
      this.AUDIT_QUANTITY = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUDIT_QUANTITY_PACK = null; } else {
      this.AUDIT_QUANTITY_PACK = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITY_PACK = null; } else {
      this.QUANTITY_PACK = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.QUANTITY_BUY_PACK = null; } else {
      this.QUANTITY_BUY_PACK = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.LINE_LAST_UPDATE = null; } else {
      this.LINE_LAST_UPDATE = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    W_SL_LD_DMS_PURCHASE_ORDER_1 o = (W_SL_LD_DMS_PURCHASE_ORDER_1) super.clone();
    o.APPROVE_DT = (o.APPROVE_DT != null) ? (java.sql.Timestamp) o.APPROVE_DT.clone() : null;
    o.PLAN_SHIP_DT = (o.PLAN_SHIP_DT != null) ? (java.sql.Timestamp) o.PLAN_SHIP_DT.clone() : null;
    o.SHIP_DT = (o.SHIP_DT != null) ? (java.sql.Timestamp) o.SHIP_DT.clone() : null;
    o.ERP_ORDER_DT = (o.ERP_ORDER_DT != null) ? (java.sql.Timestamp) o.ERP_ORDER_DT.clone() : null;
    o.ORDER_DATE = (o.ORDER_DATE != null) ? (java.sql.Timestamp) o.ORDER_DATE.clone() : null;
    o.LAST_UPDATE = (o.LAST_UPDATE != null) ? (java.sql.Timestamp) o.LAST_UPDATE.clone() : null;
    o.W_INSERT_DT = (o.W_INSERT_DT != null) ? (java.sql.Timestamp) o.W_INSERT_DT.clone() : null;
    return o;
  }

  public void clone0(W_SL_LD_DMS_PURCHASE_ORDER_1 o) throws CloneNotSupportedException {
    o.APPROVE_DT = (o.APPROVE_DT != null) ? (java.sql.Timestamp) o.APPROVE_DT.clone() : null;
    o.PLAN_SHIP_DT = (o.PLAN_SHIP_DT != null) ? (java.sql.Timestamp) o.PLAN_SHIP_DT.clone() : null;
    o.SHIP_DT = (o.SHIP_DT != null) ? (java.sql.Timestamp) o.SHIP_DT.clone() : null;
    o.ERP_ORDER_DT = (o.ERP_ORDER_DT != null) ? (java.sql.Timestamp) o.ERP_ORDER_DT.clone() : null;
    o.ORDER_DATE = (o.ORDER_DATE != null) ? (java.sql.Timestamp) o.ORDER_DATE.clone() : null;
    o.LAST_UPDATE = (o.LAST_UPDATE != null) ? (java.sql.Timestamp) o.LAST_UPDATE.clone() : null;
    o.W_INSERT_DT = (o.W_INSERT_DT != null) ? (java.sql.Timestamp) o.W_INSERT_DT.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("HEAD_ID", this.HEAD_ID);
    __sqoop$field_map.put("LINE_ID", this.LINE_ID);
    __sqoop$field_map.put("DEALER_ID", this.DEALER_ID);
    __sqoop$field_map.put("AMOUNT_SUMMARY", this.AMOUNT_SUMMARY);
    __sqoop$field_map.put("APPROVE_DT", this.APPROVE_DT);
    __sqoop$field_map.put("COLLECT_NUMBER", this.COLLECT_NUMBER);
    __sqoop$field_map.put("DELIVERY_WAREHOUSE", this.DELIVERY_WAREHOUSE);
    __sqoop$field_map.put("INDENT_FLAG", this.INDENT_FLAG);
    __sqoop$field_map.put("ERPNO", this.ERPNO);
    __sqoop$field_map.put("ERPID", this.ERPID);
    __sqoop$field_map.put("OU_TYPE", this.OU_TYPE);
    __sqoop$field_map.put("PLAN_SHIP_DT", this.PLAN_SHIP_DT);
    __sqoop$field_map.put("SHIP_DT", this.SHIP_DT);
    __sqoop$field_map.put("ERP_ORDER_DT", this.ERP_ORDER_DT);
    __sqoop$field_map.put("ORDERTYPE", this.ORDERTYPE);
    __sqoop$field_map.put("SOURCE", this.SOURCE);
    __sqoop$field_map.put("PRODUCT_NO", this.PRODUCT_NO);
    __sqoop$field_map.put("GIFT_FLAG", this.GIFT_FLAG);
    __sqoop$field_map.put("QUANTITY", this.QUANTITY);
    __sqoop$field_map.put("ROW_MONEY", this.ROW_MONEY);
    __sqoop$field_map.put("SUPPLY_PRICE", this.SUPPLY_PRICE);
    __sqoop$field_map.put("MEASURE", this.MEASURE);
    __sqoop$field_map.put("QUANTITYSEND", this.QUANTITYSEND);
    __sqoop$field_map.put("QUANTITYBUY", this.QUANTITYBUY);
    __sqoop$field_map.put("STATE", this.STATE);
    __sqoop$field_map.put("QUANTITYRECEIVED", this.QUANTITYRECEIVED);
    __sqoop$field_map.put("ERP_LINE_ID", this.ERP_LINE_ID);
    __sqoop$field_map.put("ERP_DEALER_CODE", this.ERP_DEALER_CODE);
    __sqoop$field_map.put("BG_NAME", this.BG_NAME);
    __sqoop$field_map.put("TON", this.TON);
    __sqoop$field_map.put("ORDERNO", this.ORDERNO);
    __sqoop$field_map.put("ORDER_DATE", this.ORDER_DATE);
    __sqoop$field_map.put("SHIP_CYCLE", this.SHIP_CYCLE);
    __sqoop$field_map.put("LAST_UPDATE", this.LAST_UPDATE);
    __sqoop$field_map.put("DATASOURCE_ID", this.DATASOURCE_ID);
    __sqoop$field_map.put("W_INSERT_DT", this.W_INSERT_DT);
    __sqoop$field_map.put("QUANTITYBUY_TON", this.QUANTITYBUY_TON);
    __sqoop$field_map.put("AUDIT_QUANTITY_TON", this.AUDIT_QUANTITY_TON);
    __sqoop$field_map.put("AUDIT_QUANTITY", this.AUDIT_QUANTITY);
    __sqoop$field_map.put("AUDIT_QUANTITY_PACK", this.AUDIT_QUANTITY_PACK);
    __sqoop$field_map.put("QUANTITY_PACK", this.QUANTITY_PACK);
    __sqoop$field_map.put("QUANTITY_BUY_PACK", this.QUANTITY_BUY_PACK);
    __sqoop$field_map.put("LINE_LAST_UPDATE", this.LINE_LAST_UPDATE);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("HEAD_ID", this.HEAD_ID);
    __sqoop$field_map.put("LINE_ID", this.LINE_ID);
    __sqoop$field_map.put("DEALER_ID", this.DEALER_ID);
    __sqoop$field_map.put("AMOUNT_SUMMARY", this.AMOUNT_SUMMARY);
    __sqoop$field_map.put("APPROVE_DT", this.APPROVE_DT);
    __sqoop$field_map.put("COLLECT_NUMBER", this.COLLECT_NUMBER);
    __sqoop$field_map.put("DELIVERY_WAREHOUSE", this.DELIVERY_WAREHOUSE);
    __sqoop$field_map.put("INDENT_FLAG", this.INDENT_FLAG);
    __sqoop$field_map.put("ERPNO", this.ERPNO);
    __sqoop$field_map.put("ERPID", this.ERPID);
    __sqoop$field_map.put("OU_TYPE", this.OU_TYPE);
    __sqoop$field_map.put("PLAN_SHIP_DT", this.PLAN_SHIP_DT);
    __sqoop$field_map.put("SHIP_DT", this.SHIP_DT);
    __sqoop$field_map.put("ERP_ORDER_DT", this.ERP_ORDER_DT);
    __sqoop$field_map.put("ORDERTYPE", this.ORDERTYPE);
    __sqoop$field_map.put("SOURCE", this.SOURCE);
    __sqoop$field_map.put("PRODUCT_NO", this.PRODUCT_NO);
    __sqoop$field_map.put("GIFT_FLAG", this.GIFT_FLAG);
    __sqoop$field_map.put("QUANTITY", this.QUANTITY);
    __sqoop$field_map.put("ROW_MONEY", this.ROW_MONEY);
    __sqoop$field_map.put("SUPPLY_PRICE", this.SUPPLY_PRICE);
    __sqoop$field_map.put("MEASURE", this.MEASURE);
    __sqoop$field_map.put("QUANTITYSEND", this.QUANTITYSEND);
    __sqoop$field_map.put("QUANTITYBUY", this.QUANTITYBUY);
    __sqoop$field_map.put("STATE", this.STATE);
    __sqoop$field_map.put("QUANTITYRECEIVED", this.QUANTITYRECEIVED);
    __sqoop$field_map.put("ERP_LINE_ID", this.ERP_LINE_ID);
    __sqoop$field_map.put("ERP_DEALER_CODE", this.ERP_DEALER_CODE);
    __sqoop$field_map.put("BG_NAME", this.BG_NAME);
    __sqoop$field_map.put("TON", this.TON);
    __sqoop$field_map.put("ORDERNO", this.ORDERNO);
    __sqoop$field_map.put("ORDER_DATE", this.ORDER_DATE);
    __sqoop$field_map.put("SHIP_CYCLE", this.SHIP_CYCLE);
    __sqoop$field_map.put("LAST_UPDATE", this.LAST_UPDATE);
    __sqoop$field_map.put("DATASOURCE_ID", this.DATASOURCE_ID);
    __sqoop$field_map.put("W_INSERT_DT", this.W_INSERT_DT);
    __sqoop$field_map.put("QUANTITYBUY_TON", this.QUANTITYBUY_TON);
    __sqoop$field_map.put("AUDIT_QUANTITY_TON", this.AUDIT_QUANTITY_TON);
    __sqoop$field_map.put("AUDIT_QUANTITY", this.AUDIT_QUANTITY);
    __sqoop$field_map.put("AUDIT_QUANTITY_PACK", this.AUDIT_QUANTITY_PACK);
    __sqoop$field_map.put("QUANTITY_PACK", this.QUANTITY_PACK);
    __sqoop$field_map.put("QUANTITY_BUY_PACK", this.QUANTITY_BUY_PACK);
    __sqoop$field_map.put("LINE_LAST_UPDATE", this.LINE_LAST_UPDATE);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
