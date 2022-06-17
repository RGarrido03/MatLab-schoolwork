classdef ex3_code < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure      matlab.ui.Figure
        aSlider       matlab.ui.control.Slider
        aSliderLabel  matlab.ui.control.Label
        UIAxes        matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            x = -3:0.01:3;
            y = -1 * x.^2 + x.^4 + 7;
            plot(app.UIAxes,x,y)
            app.UIAxes.XLim = [-3,3];
            app.UIAxes.YLim = [0,30];
            drawnow
        end

        % Callback function: aSlider, aSlider
        function aSliderValueChanged(app, event)
            value = app.aSlider.Value;
            x = -3:0.01:3;
            y = -value * x.^2 + x.^4 + 7;
            plot(app.UIAxes,x,y)
            app.UIAxes.XLim = [-3,3];
            app.UIAxes.YLim = [0,30];
            drawnow
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Gráfico da função')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [32 113 577 334];

            % Create aSliderLabel
            app.aSliderLabel = uilabel(app.UIFigure);
            app.aSliderLabel.HorizontalAlignment = 'right';
            app.aSliderLabel.Position = [223 63 25 22];
            app.aSliderLabel.Text = 'a';

            % Create aSlider
            app.aSlider = uislider(app.UIFigure);
            app.aSlider.Limits = [1 5];
            app.aSlider.ValueChangedFcn = createCallbackFcn(app, @aSliderValueChanged, true);
            app.aSlider.ValueChangingFcn = createCallbackFcn(app, @aSliderValueChanged, true);
            app.aSlider.Position = [269 72 150 3];
            app.aSlider.Value = 1;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = ex3_code

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end