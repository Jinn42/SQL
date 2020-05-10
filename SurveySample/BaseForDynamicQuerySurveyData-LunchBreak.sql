-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE getAllSurveyData
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @strQueryTemplateForAnswerColumn nvarchar(max);
	DECLARE @strQueryTemplateOuterUnionQuery nvarchar(max);
	DECLARE @currentSurveyId int;

	SET @strQueryTemplateForAnswerColumn = '
			COALESCE(
				(
					SELECT a.Answer_Value
					FROM Answer as a
					WHERE
						a.UserId = u.UserId
						AND a.SurveyId = <SURVEY_ID>
						AND a.QuestionId = <QUESTION_ID>
				), -1) AS ANS_Q<QUESTION_ID> ';

	SET @strQueryTemplateOuterUnionQuery = '
			SELECT
					UserId
					, <SURVEY_ID> as SurveyId
					, <DYNAMIC_QUESTION_ANSWERS>
			FROM
				[User] as u
			WHERE EXISTS
			(
					SELECT *
					FROM Answer as a
					WHERE u.UserId = a.UserId
					AND a.SurveyId = <SURVEY_ID>
			)
	';

	--Cursor variables are the only ones to not have an @ in front of their names
	DECLARE surveyCursor CURSOR FOR
							SELECT SurveyId
							FROM Survey
							ORDER BY SurveyId;

	OPEN surveyCursor; -- when opened, the cursor is before the first row
	FETCH NEXT FROM surveyCursor INTO @currentSurveyId; --first row read

	WHILE @@FETCH_STATUS = 0 --AS LONG AS FETCH_STATUS IS EQUAL TO 0 --> there's a row to read
	BEGIN
		
		-- MAIN LOOP, OVER ALL THE SURVEYS

		FETCH NEXT FROM surveyCursor INTO @currentSurveyId;
	END;

	CLOSE surveyCursor;
	DEALLOCATE surveyCursor;

END
GO
