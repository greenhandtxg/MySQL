
# 最基本的SELECT语句 SELECT 字段1,字段2,... FROM 表名

SELECT 1,3*2;

SELECT 9/2;

SELECT 1+1 FROM DUAL;  -- DUAL:伪表


-- 一般情况下，除非需要使用表中所有的字段数据，最好不要使用通配符‘*’。使用通配符虽然可以节
-- 省输入查询语句的时间，但是获取不需要的列数据通常会降低查询和所使用的应用程序的效率。通
-- 配符的优势是，当不知道所需要的列的名称时，可以通过它获取它们。
-- 在生产环境下，不推荐你直接使用 SELECT * 进行查询。

-- MySQL中的SQL语句是不区分大小写的，因此SELECT和select的作用是相同的
-- 但是，许多开发人员习惯将关键字大写、数据列和表名小写
-- 读者也应该养成一个良好的编程习惯，这样写出来的代码更容易阅读和维护。



-- 选择全部列
-- *表示表中所有的字段
SELECT * FROM employees;

-- 选择特定的列
SELECT last_name,first_name,salary FROM employees;


-- 列的别名
-- 1、原列名 新列名
SELECT last_name "姓氏" FROM employees;

-- 2、as(alias,别名)
SELECT last_name lst_name,first_name AS fst_name FROM employees;

-- 3、""
	-- 列的别名用"" (不建议用'')
	-- 字符串用''
SELECT salary * 12 "Annual Salary" FROM employees;

SELECT last_name "姓 氏" FROM employees;



-- 去除重复行
-- 查询表中有哪些部门id
SELECT DISTINCT department_id FROM employees;

-- 下面的查询没有实际意义
SELECT DISTINCT department_id,salary FROM employees;



-- 空值null
-- 不等同于0,'','null'
-- 空值参与运算,结果为空
SELECT employee_id "员工id",salary "月工资",salary * (1 + commission_pct) * 12 "年工资",commission_pct "提成"
FROM employees;

--  解决方法:使用IFNULL(a,b) 如果a为null,则用0替换
SELECT employee_id,salary "月工资",salary * (1 + IFNULL(commission_pct,0)) * 12 "年工资"
FROM employees;




-- 着重号
-- 我们需要保证表中的字段、表名等没有和保留字、数据库系统或常用方法冲突。
-- 如果真的相同，请在SQL语句中使用一对``（着重号）引起来
SELECT * FROM `order`;




-- 查询常数
-- SELECT 查询还可以对常数进行查询。
-- 就是在 SELECT 查询结果中增加一列固定的常数列。
-- 这列的取值是我们指定的，而不是从数据表中动态取出的
SELECT "ByteDance" AS "公司",salary "薪资" FROM employees;




-- 显示表结构
DESCRIBE employees;		# 显示表中详细信息

DESC employees;





-- 过滤数据
-- WHERE要写在FROM后面
SELECT * FROM employees WHERE department_id = 90;

SELECT * FROM employees WHERE last_name = 'King'

SELECT * FROM employees WHERE last_name = 'king'		# window MySQL不区分大小写







